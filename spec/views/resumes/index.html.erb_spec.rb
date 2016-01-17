require 'rails_helper'

RSpec.describe "resumes/index", type: :view do
  before(:each) do
    assign(:resumes, [
      Resume.create!(
        :firstname => "Firstname",
        :lastname => "Lastname",
        :email => "Email",
        :cv => "MyText"
      ),
      Resume.create!(
        :firstname => "Firstname",
        :lastname => "Lastname",
        :email => "Email",
        :cv => "MyText"
      )
    ])
  end

  it "renders a list of resumes" do
    render
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
