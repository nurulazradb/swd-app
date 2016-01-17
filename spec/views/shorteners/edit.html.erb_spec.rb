require 'rails_helper'

RSpec.describe "shorteners/edit", type: :view do
  before(:each) do
    @shortener = assign(:shortener, Shortener.create!(
      :url => "MyString",
      :slug => "MyString"
    ))
  end

  it "renders the edit shortener form" do
    render

    assert_select "form[action=?][method=?]", shortener_path(@shortener), "post" do

      assert_select "input#shortener_url[name=?]", "shortener[url]"

      assert_select "input#shortener_slug[name=?]", "shortener[slug]"
    end
  end
end
