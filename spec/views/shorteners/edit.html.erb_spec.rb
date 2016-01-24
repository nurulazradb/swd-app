require 'rails_helper'

RSpec.describe "shorteners/edit", type: :view do
  before(:each) do
    @shortener = create(:shortener)
  end

  it "renders the edit shortener form" do
    render

    assert_select "form[action=?][method=?]", shortener_path(@shortener), "post" do

      assert_select "input#shortener_url[name=?]", "shortener[url]"

    end
  end
end
