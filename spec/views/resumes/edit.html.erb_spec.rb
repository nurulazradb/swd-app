require 'rails_helper'

RSpec.describe "resumes/edit", type: :view do
  before(:each) do
    @resume = create(:resume)
  end

  it "renders the edit resume form" do
    render

    assert_select "form[action=?][method=?]", resume_path(@resume), "post" do

      assert_select "input#resume_firstname[name=?]", "resume[firstname]"

      assert_select "input#resume_lastname[name=?]", "resume[lastname]"

      assert_select "input#resume_email[name=?]", "resume[email]"

      assert_select "textarea#resume_cv[name=?]", "resume[cv]"
    end
  end
end
