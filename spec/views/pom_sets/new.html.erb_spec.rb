require 'spec_helper'

describe "pom_sets/new" do
  before(:each) do
    assign(:pom_set, stub_model(PomSet).as_new_record)
  end

  it "renders new pom_set form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pom_sets_path, :method => "post" do
    end
  end
end
