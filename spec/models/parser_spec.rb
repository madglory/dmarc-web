require 'spec_helper'
require 'zipruby'

describe Parser do
  # pending "add some examples to (or delete) #{__FILE__}"

  before(:all) do
    @file = File.join(Rails.root, 'spec/fixtures', 'google.com!gamebattles.com!1339027200!1339113599.xml')
    @document = Nokogiri::XML.parse(File.open(@file))
  end

  it "builds a Nokogiri document from a file" do
    document = Parser.build_document_from @file
    document.to_xml.should == @document.to_xml
  end

  it "extracts a valid report when given a sample file" do
    report = Parser.extract_report_from @document
    report.should be_valid
  end

  it "extracts valid reports when given a sample file and a valid report" do
    report = Parser.extract_report_from @document
    report.should be_valid

    records = Parser.extract_records_from @document, report
    records.length.should be >= 1
    records.each do |record|
      record.should be_valid
    end
  end

end
