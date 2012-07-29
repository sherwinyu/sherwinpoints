require "spec_helper"

describe PomsController do
  describe "routing" do

    it "routes to #index" do
      get("/poms").should route_to("poms#index")
    end

    it "routes to #new" do
      get("/poms/new").should route_to("poms#new")
    end

    it "routes to #show" do
      get("/poms/1").should route_to("poms#show", :id => "1")
    end

    it "routes to #edit" do
      get("/poms/1/edit").should route_to("poms#edit", :id => "1")
    end

    it "routes to #create" do
      post("/poms").should route_to("poms#create")
    end

    it "routes to #update" do
      put("/poms/1").should route_to("poms#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/poms/1").should route_to("poms#destroy", :id => "1")
    end

  end
end
