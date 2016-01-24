require 'rails_helper'

RSpec.describe "resumes/index", type: :view do
  before(:each) do
    assign(:resumes, [
      create(:resume, :male),
      create(:resume, :female)
    ])
  end

  it "renders a list of resumes" do
    render

    expect(rendered).to match /John/
    expect(rendered).to match /Jane/
    expect(rendered).to match /john.doe@email.com/
    expect(rendered).to match /jane.doe@email.com/
  end
end
