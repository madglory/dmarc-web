class User
  include Mongoid::Document
  include Mongoid::Timestamps
  # attr_accessible :title, :body

  has_many :reports
end
