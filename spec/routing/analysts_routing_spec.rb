require "spec_helper"

describe AnalystsController do
  describe "routing" do

    it "routes to #index" do
      get("/analysts").should route_to("analysts#index")
    end

    it "routes to #new" do
      get("/analysts/new").should route_to("analysts#new")
    end

    it "routes to #show" do
      get("/analysts/1").should route_to("analysts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/analysts/1/edit").should route_to("analysts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/analysts").should route_to("analysts#create")
    end

    it "routes to #update" do
      put("/analysts/1").should route_to("analysts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/analysts/1").should route_to("analysts#destroy", :id => "1")
    end

  end
end
