require 'spec_helper'

describe "analysts/index" do
  before(:each) do
    assign(:analysts, [
      stub_model(Analyst,
        :name => "Name",
        :email => "Email",
        :analyst => false
      ),
      stub_model(Analyst,
        :name => "Name",
        :email => "Email",
        :analyst => false
      )
    ])
  end

  it "renders a list of analysts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
