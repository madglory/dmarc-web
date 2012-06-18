require 'base64'

class ValidatedFeedback < ActiveRecord::Base
  # attr_accessible :title, :body
  serialize :content
  serialize :results

end
