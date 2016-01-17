require 'rails_helper'

RSpec.describe "shorteners/new", type: :view do
  before(:each) do
    assign(:shortener, Shortener.new(
      :url => "MyString",
      :slug => "MyString"
    ))
  end

  it "renders new shortener form" do
    render

    assert_select "form[action=?][method=?]", shorteners_path, "post" do

      assert_select "input#shortener_url[name=?]", "shortener[url]"

      assert_select "input#shortener_slug[name=?]", "shortener[slug]"
    end
  end
end
