require 'spec_helper'

describe "poms/edit" do
  before(:each) do
    @pom = assign(:pom, stub_model(Pom,
      :description => "MyString",
      :realtime => false,
      :successful => false,
      :pom_set_id => 1
    ))
  end

  it "renders the edit pom form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => poms_path(@pom), :method => "post" do
      assert_select "input#pom_description", :name => "pom[description]"
      assert_select "input#pom_realtime", :name => "pom[realtime]"
      assert_select "input#pom_successful", :name => "pom[successful]"
      assert_select "input#pom_pom_set_id", :name => "pom[pom_set_id]"
    end
  end
end
