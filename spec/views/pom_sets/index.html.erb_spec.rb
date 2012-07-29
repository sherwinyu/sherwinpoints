require 'spec_helper'

describe "pom_sets/index" do
  before(:each) do
    assign(:pom_sets, [
      stub_model(PomSet),
      stub_model(PomSet)
    ])
  end

  it "renders a list of pom_sets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
