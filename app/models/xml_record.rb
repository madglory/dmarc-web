class XmlRecord
  include SAXMachine
  element :source_ip
  element :count,       :as => :message_count
  element :disposition, :as =>:policy_evaluated_disposition
  #element :policy_evaluated_dkim
  #element :policy_evaluated_spf
  #element :policy_evaluated_override_reasons, :as => :policy_evaluated_override_reason
  element :envelope_to, :as => :identifier_envelope_to
  element :header_from, :as => :identifier_header_from
end
