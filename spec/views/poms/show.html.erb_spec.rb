require 'spec_helper'

describe "poms/show" do
  before(:each) do
    @pom = assign(:pom, stub_model(Pom,
      :description => "Description",
      :realtime => false,
      :successful => false,
      :pom_set_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/1/)
  end
end
