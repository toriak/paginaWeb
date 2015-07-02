require "rails_helper"

RSpec.describe VacancyPolicy, :type => :model do
  subject { VacancyPolicy }

  let(:user)   {User.new(email: "user@example.com", password: "12345678", password_confirmation: "12345678")}
  let(:creator) {User.new(email: "author@example.com", password: "12345678", password_confirmation: "12345678")}
  let(:admin) do
    user_admin = User.new(email: "admin@example.com", password:"12345678", password_confirmation: "12345678")
    user_admin.add_role :admin
    user_admin
  end
  let(:guitarra) {Instrument.new(name:"guitarra")}

  let(:banda) {Band.new(name: "band of shill",mail:"shill@example.com",creator: creator)}

  let(:vacancy) {Vacancy.new(band: banda, instrument: guitarra)}

  before (:each)do
      user
      creator
      admin
      banda
      guitarra
      vacancy
    end

  permissions :new? do
    it "is denied to non­logged users-nil" do
      expect(subject).not_to permit(nil,vacancy)
    end
    it "is allowed to any logged in user-user" do
      expect(subject).to permit(user,vacancy)
    end
    it "is allowed to any logged in user-creator" do
      expect(subject).to permit(creator,vacancy)
    end
    it "is allowed to any logged in user-admin" do
      expect(subject).to permit(admin,vacancy)
    end
  end

  permissions :index? do
    it "is denied to non­logged users-nil" do
      expect(subject).not_to permit(nil,vacancy)
    end
    it "is allowed to any logged in user-user" do
      expect(subject).to permit(user,vacancy)
    end
    it "is allowed to any logged in user-creator" do
      expect(subject).to permit(creator,vacancy)
    end
    it "is allowed to any logged in user-admin" do
      expect(subject).to permit(admin,vacancy)
    end
  end

  permissions :create? do
    it "is denied to non­logged users-nil" do
      expect(subject).not_to permit(nil,vacancy)
    end
    it "is allowed to any logged in user-user" do
      expect(subject).to permit(user,vacancy)
    end
    it "is allowed to any logged in user-creator" do
      expect(subject).to permit(creator,vacancy)
    end
    it "is allowed to any logged in user-admin" do
      expect(subject).to permit(admin,vacancy)
    end
  end

  permissions :update? do
    it "is denied to non­logged users" do
      expect(subject).not_to permit(nil,vacancy)
    end
    it "is allowed to any logged in user-user"do
      expect(subject).not_to permit(user,vacancy)
    end
    it "is allowed to any logged in user-creator"do
      expect(subject).to permit(creator,vacancy)
    end
    it "is allowed to any logged in user-admin"do
      expect(subject).to permit(admin,vacancy)
    end
  end

  permissions :destroy? do
    it "is denied to non­logged users" do
      expect(subject).not_to permit(nil,vacancy)
    end
    it "is allowed to any logged in user-user"do
      expect(subject).not_to permit(user,vacancy)
    end
    it "is allowed to any logged in user-creator"do
      expect(subject).to permit(creator,vacancy)
    end
    it "is allowed to any logged in user-admin"do
      expect(subject).to permit(admin,vacancy)
    end
  end
end
