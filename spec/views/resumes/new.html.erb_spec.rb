require 'rails_helper'

RSpec.describe "resumes/new", type: :view do
  before(:each) do
    assign(:resume, Resume.new(
      :firstname => "MyString",
      :lastname => "MyString",
      :email => "MyString",
      :cv => "MyText"
    ))
  end

  it "renders new resume form" do
    render

    assert_select "form[action=?][method=?]", resumes_path, "post" do

      assert_select "input#resume_firstname[name=?]", "resume[firstname]"

      assert_select "input#resume_lastname[name=?]", "resume[lastname]"

      assert_select "input#resume_email[name=?]", "resume[email]"

      assert_select "textarea#resume_cv[name=?]", "resume[cv]"
    end
  end
end
