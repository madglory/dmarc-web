class XmlPolicyPublished
  include SAXMachine
  element :domain
  element :adkim, :as => :dkim_alignment
  element :aspf,  :as => :spf_alignment
  element :p,     :as => :domain_disposition
  element :sp,    :as => :subdomain_disposition
  element :pct,   :as => :published_percentage
end
