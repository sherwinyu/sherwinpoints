require 'spec_helper'

describe "pom_sets/show" do
  before(:each) do
    @pom_set = assign(:pom_set, stub_model(PomSet))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
