require 'rails_helper'

RSpec.describe "shorteners/index", type: :view do
  before(:each) do
    assign(:shorteners, [
      Shortener.create!(
        :url => "Url",
        :slug => "Slug"
      ),
      Shortener.create!(
        :url => "Url",
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of shorteners" do
    render
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
