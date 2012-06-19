class Report < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  has_many :records
  has_one :provider

  SAXMachine.configure(Report) do |c|
    c.element  :org_name,           :as => :name
    c.element  :email,              :as => :email
    c.element  :extra_contact_info, :as => :contact_info
    c.element  :report_id,          :as => :provider_report_id
    c.element  :begin,              :as => :begins_at
    c.element  :end,                :as => :ends_at
    c.elements :error,              :as => :errors
    #c.elements :record,             :as => :records, :class => XMLRecord
    #c.element  :policy_published,    :class => XMLPolicyPublished
  end
end
