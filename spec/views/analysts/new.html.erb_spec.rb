require 'spec_helper'

describe "analysts/new" do
  before(:each) do
    assign(:analyst, stub_model(Analyst,
      :name => "MyString",
      :email => "MyString",
      :analyst => false
    ).as_new_record)
  end

  it "renders new analyst form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", analysts_path, "post" do
      assert_select "input#analyst_name[name=?]", "analyst[name]"
      assert_select "input#analyst_email[name=?]", "analyst[email]"
      assert_select "input#analyst_analyst[name=?]", "analyst[analyst]"
    end
  end
end
