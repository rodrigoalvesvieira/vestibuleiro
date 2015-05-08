require 'rails_helper'

RSpec.describe "Teachers", type: :request do
  describe "GET /teachers" do
    it "works! (now write some real specs)" do
      get teachers_path
      expect(response).to have_http_status(200)
    end
  end
end
