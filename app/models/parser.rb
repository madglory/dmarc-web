require 'nokogiri'

class Parser

  extend ParserUtils

  # Main entry point
  def self.process
    zip_files = find_files
    xml_files = decompress_files(zip_files)
    xml_files.each do |xml_file|
      xml_report = XMLReport.parse(report)
      report   = extract_report_from document
      records  = extract_records_from(document, report)
    end
    return true
  end

  def self.build_document_from(file)
    Rails.logger.debug "Parser is starting #{file}"
    Nokogiri::XML.parse(File.open(file))
  end

  def self.extract_report_from(document)
    attributes = {
      :provider_name                       => document.xpath('//org_name').inner_text,
      :provider_email                      => document.xpath('//email').inner_text,
      :provider_contact_info               => document.xpath('//extra_contact_info').inner_text,
      :report_id                           => document.xpath('//report_id').inner_text,
      :begins_at                           => Time.at(document.xpath('//date_range/begin').inner_text.to_i),
      :ends_at                             => Time.at(document.xpath('//date_range/end').inner_text.to_i),
      :dkim_alignment_mode                 => document.xpath('//policy_published/adkim').inner_text,
      :spf_alignment_mode                  => document.xpath('//policy_published/aspf').inner_text,
      :requested_domain_handling_policy    => document.xpath('//policy_published/p').inner_text,
      :requested_subdomain_handling_policy => document.xpath('//policy_published/sp').inner_text,
      :sampling_rate                       => document.xpath('//policy_published/pct').inner_text,
      :domain                              => document.xpath('//policy_published/domain').inner_text
    }
    Rails.logger.debug "Parser about to create a report using " + attributes.inspect
    report=Report.find_or_create_by(attributes)
  end

  def self.extract_records_from(document, report=Report.new)
    document.xpath('//record').each do |record|

      auth_results     = Hash.from_xml(record.xpath('auth_results').first.to_xml)["auth_results"]
      policy_evaluated = Hash.from_xml((record.xpath('row/policy_evaluated').first || {}).to_xml)["policy_evaluated"]
      identifiers      = Hash.from_xml((record.xpath('identifiers').first || {}).to_xml)["identifiers"]

      attributes = {
        :source_ip => record.xpath('row/source_ip').inner_text,
        :count => record.xpath('row/count').inner_text
      }
      # TODO: This is completely wrong.  I think it continually
      # appends records to this report.
      record = report.records.find_or_create_by attributes
      record.policy_evaluated = PolicyEvaluated.new(policy_evaluated)
      record.auth_results.find_or_initialize_by auth_results
      record.identities.find_or_initialize_by   identifiers
    end
    report.save
    report.records
  end

end
