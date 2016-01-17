require 'rails_helper'

RSpec.describe Shortener, type: :model do
  it { should respond_to(:url) }
  it { should respond_to(:slug) }

  it do
    shortener = build(:shortener, :invalid)
    should validate_presence_of :url
    should_not allow_value(shortener.url).for :url
  end

  it 'should changes the numbers of shorteners' do
    shortener = build(:shortener)
    expect { shortener.save }.to change { Shortener.count }.by 1
  end
end
