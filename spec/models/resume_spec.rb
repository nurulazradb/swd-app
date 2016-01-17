require 'rails_helper'

RSpec.describe Resume, type: :model do
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:firstname) }
  it { is_expected.to respond_to(:lastname) }
  it { is_expected.to respond_to(:cv) }

  it 'should not valid' do
    resume = build(:resume, :invalid)
    should validate_presence_of :cv
    should_not allow_value(resume.email).for :email
  end

  it 'should changes the numbers of resumes' do
    resume = build(:resume)
    expect { resume.save }.to change { Resume.count }.by 1
  end
end
