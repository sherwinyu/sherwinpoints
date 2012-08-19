require 'spec_helper'

describe "poms/index" do
  before(:each) do
    assign(:poms, [
      stub_model(Pom,
        :description => "Description",
        :realtime => false,
        :successful => false,
        :pom_set_id => 1
      ),
      stub_model(Pom,
        :description => "Description",
        :realtime => false,
        :successful => false,
        :pom_set_id => 1
      )
    ])
  end

  it "renders a list of poms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
