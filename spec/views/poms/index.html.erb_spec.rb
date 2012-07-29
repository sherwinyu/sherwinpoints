require 'spec_helper'

describe "poms/index" do
  before(:each) do
    assign(:poms, [
      stub_model(Pom),
      stub_model(Pom)
    ])
  end

  it "renders a list of poms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
