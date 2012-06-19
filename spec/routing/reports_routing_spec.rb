require "spec_helper"

describe Admin::ReportsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin_reports").should route_to("admin_reports#index")
    end

    it "routes to #new" do
      get("/admin_reports/new").should route_to("admin_reports#new")
    end

    it "routes to #show" do
      get("/admin_reports/1").should route_to("admin_reports#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin_reports/1/edit").should route_to("admin_reports#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin_reports").should route_to("admin_reports#create")
    end

    it "routes to #update" do
      put("/admin_reports/1").should route_to("admin_reports#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin_reports/1").should route_to("admin_reports#destroy", :id => "1")
    end

  end
end
