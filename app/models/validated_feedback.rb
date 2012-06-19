require 'nokogiri' #Needed in order to make deserializeation of nested objects work @BJC

class ValidatedFeedback < ActiveRecord::Base
  # attr_accessible :title, :body
  serialize :content
  serialize :results

end
