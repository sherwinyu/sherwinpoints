require 'spec_helper'

describe "poms/show" do
  before(:each) do
    @pom = assign(:pom, stub_model(Pom))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
