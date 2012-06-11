class Record
  include Mongoid::Document
  include Mongoid::Timestamps

  field :source_ip, type: String
  field :count, type: Integer

  embeds_one :policy_evaluated
  embeds_many :identities
  embeds_many :auth_results

  embedded_in :report
end

class PolicyEvaluated
  include Mongoid::Document
  embedded_in :record
end

class Identity
  include Mongoid::Document
  embedded_in :record
end

class AuthResult
  include Mongoid::Document
  embedded_in :record
end
