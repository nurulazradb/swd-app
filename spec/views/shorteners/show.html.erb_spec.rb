require 'rails_helper'

RSpec.describe "shorteners/show", type: :view do
  before(:each) do
    @shortener = create(:shortener)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Slug/)
  end
end
