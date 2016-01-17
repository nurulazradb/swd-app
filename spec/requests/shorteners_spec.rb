require 'rails_helper'

RSpec.describe "Shorteners", type: :request do
  describe "GET /shorteners" do
    it "works! (now write some real specs)" do
      get shorteners_path
      expect(response).to have_http_status(200)
    end
  end
end
