require 'rails_helper'

RSpec.describe "shorteners/index", type: :view do
  before(:each) do
    assign(:shorteners, [
      create(:shortener),
      create(:shortener)
    ])
  end

  it "renders a list of shorteners" do
    render
    expect(rendered).to match /Listing Shortener/
    expect(rendered).to match /path\/to\/long\/url/
    expect(rendered).to match /clip\:/
  end
end
