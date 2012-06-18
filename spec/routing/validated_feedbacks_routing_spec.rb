require "spec_helper"

describe ValidatedFeedbacksController do
  describe "routing" do

    it "routes to #new" do
      get("/validate").should route_to("validated_feedbacks#new")
    end

    it "routes to #show" do
      get("/validate/result/1").should route_to("validated_feedbacks#show", :id => "1")
    end

    it "routes to #create" do
      post("/validate").should route_to("validated_feedbacks#create")
    end

  end
end
