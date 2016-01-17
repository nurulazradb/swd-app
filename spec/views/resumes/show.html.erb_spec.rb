require 'rails_helper'

RSpec.describe "resumes/show", type: :view do
  before(:each) do
    @resume = assign(:resume, Resume.create!(
      :firstname => "Firstname",
      :lastname => "Lastname",
      :email => "Email",
      :cv => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Firstname/)
    expect(rendered).to match(/Lastname/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/MyText/)
  end
end
