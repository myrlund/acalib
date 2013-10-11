require "spec_helper"

describe CollectionsController do
  describe "routing" do

    it "routes to #index" do
      get("/collections.json").should route_to("collections#index", format: "json")
    end

    it "does not route to #new" do
      get("/collections/new.json").should_not route_to("collections#new", format: "json")
    end

    it "routes to #show" do
      get("/collections/1.json").should route_to("collections#show", :id => "1", format: "json")
    end

    it "does not route to #edit" do
      get("/collections/1/edit.json").should_not route_to("collections#edit", :id => "1", format: "json")
    end

    it "routes to #create" do
      post("/collections.json").should route_to("collections#create", format: "json")
    end

    it "routes to #update" do
      put("/collections/1.json").should route_to("collections#update", :id => "1", format: "json")
    end

    it "routes to #destroy" do
      delete("/collections/1.json").should route_to("collections#destroy", :id => "1", format: "json")
    end

  end
end
