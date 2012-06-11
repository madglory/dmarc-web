class Report
  include Mongoid::Document
  include Mongoid::Timestamps

  field :provider_name, type: String
  field :provder_email, type: String
  field :provider_contact_info, type: String
  field :report_id, type: String
  field :begins_at, type: DateTime
  field :ends_at, type: DateTime
  field :dkim_alignment_mode, type: String
  field :spf_alignment_mode, type: String
  field :requested_domain_handling_policy, type: String
  field :requested_subdomain_handling_policy, type: String
  field :sampling_rate, type: Integer
  field :domain, type: String

  attr_accessible :provider_name,
                  :provider_email,
                  :provider_contact_info,
                  :report_id,
                  :begins_at,
                  :ends_at,
                  :dkim_alignment_mode,
                  :spf_alignment_mode,
                  :requested_domain_handling_policy,
                  :requested_subdomain_handling_policy,
                  :sampling_rate,
                  :domain

  embeds_many :records

end
