require "rails_helper"

RSpec.describe Vacancy, :type => :model do

  let(:user)   {User.new(email: "user@example.com", password: "12345678", password_confirmation: "12345678")}
  let(:creator) {User.new(email: "author@example.com", password: "12345678", password_confirmation: "12345678")}
  let(:admin) do
    user_admin = User.new(email: "admin@example.com", password:"12345678", password_confirmation: "12345678")
    user_admin.add_role :admin
    user_admin
  end

  let(:guitarra) {Instrument.create!(name:"guitarra")}
  let(:banda) {Band.create!(name:"band of shill",mail:"shill@example.com",creator: creator)}

  describe "Validations" do
    before (:each) {
      DatabaseCleaner.clean
    }
    it " is not allowed when band is nil" do
      expect(Vacancy.new(band: nil, instrument: guitarra)).not_to be_valid
    end
    it " is not allowed when instrument is nil" do
      expect(Vacancy.new(band: banda, instrument: nil)).not_to be_valid
    end
    it " is not allowed" do
      expect(Vacancy.new(band: banda, instrument: guitarra)).to be_valid
    end
  end
end
