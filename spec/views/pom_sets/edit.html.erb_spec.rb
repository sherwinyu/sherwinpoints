require 'spec_helper'

describe "pom_sets/edit" do
  before(:each) do
    @pom_set = assign(:pom_set, stub_model(PomSet))
  end

  it "renders the edit pom_set form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pom_sets_path(@pom_set), :method => "post" do
    end
  end
end
