class Provider
  include Mongoid::Document

  attr_accessible :name, :email, :contact_info

  embedded_in :report

  field :name, type: String
  field :email, type: String
  field :contact_info, type: String
end
