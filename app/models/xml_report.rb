class XMLReport
  include SAXMachine
  element  :org_name,           :as => :name
  element  :email,              :as => :email
  element  :extra_contact_info, :as => :contact_info
  element  :report_id,          :as => :provider_report_id
  element  :begin,              :as => :begins_at
  element  :end,                :as => :ends_at
  elements :error,              :as => :errors
  elements :record,             :as => :records, :class => XMLRecord
  element :policy_published,    :class => XMLPolicyPublished

  attr_accessor :file

end
