require 'spec_helper'

describe "analysts/edit" do
  before(:each) do
    @analyst = assign(:analyst, stub_model(Analyst,
      :name => "MyString",
      :email => "MyString",
      :analyst => false
    ))
  end

  it "renders the edit analyst form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", analyst_path(@analyst), "post" do
      assert_select "input#analyst_name[name=?]", "analyst[name]"
      assert_select "input#analyst_email[name=?]", "analyst[email]"
      assert_select "input#analyst_analyst[name=?]", "analyst[analyst]"
    end
  end
end
