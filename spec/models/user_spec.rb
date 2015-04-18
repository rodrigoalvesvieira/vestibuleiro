require 'rails_helper'

RSpec.describe User, type: :model do
  context "object creation" do

    pwd = "hansohanso"

    it "fails because of no password" do
      expect(User.new({ email: "hans@solo.com" }).save).to be(false)
    end

    it "fails because password is too short" do
      expect(User.new({ email: "hans@solo.com", password: 'han' }).save).to be(false)
    end

    it "fails because password confirmation doesn't match" do
      user = User.new({ email: "rav2@cin.ufpe.br", password: pwd, password_confirmation: "aa"})

      expect(user.save).to eq(false)
    end
  end
end
