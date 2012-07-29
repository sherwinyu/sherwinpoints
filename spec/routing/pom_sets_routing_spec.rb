require "spec_helper"

describe PomSetsController do
  describe "routing" do

    it "routes to #index" do
      get("/pom_sets").should route_to("pom_sets#index")
    end

    it "routes to #new" do
      get("/pom_sets/new").should route_to("pom_sets#new")
    end

    it "routes to #show" do
      get("/pom_sets/1").should route_to("pom_sets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pom_sets/1/edit").should route_to("pom_sets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pom_sets").should route_to("pom_sets#create")
    end

    it "routes to #update" do
      put("/pom_sets/1").should route_to("pom_sets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pom_sets/1").should route_to("pom_sets#destroy", :id => "1")
    end

  end
end
