require 'spec_helper'

describe "poms/edit" do
  before(:each) do
    @pom = assign(:pom, stub_model(Pom))
  end

  it "renders the edit pom form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => poms_path(@pom), :method => "post" do
    end
  end
end
