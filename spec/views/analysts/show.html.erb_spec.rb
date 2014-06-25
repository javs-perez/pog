require 'spec_helper'

describe "analysts/show" do
  before(:each) do
    @analyst = assign(:analyst, stub_model(Analyst,
      :name => "Name",
      :email => "Email",
      :analyst => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/false/)
  end
end
