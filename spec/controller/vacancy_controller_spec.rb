require "rails_helper"

RSpec.describe VacanciesController, :type => :controller do

  let(:user) {
    User.create!(email: "newuser@example.com", password: "12345678", password_confirmation: "12345678")
  }

  let(:guitarra) {Instrument.create!(name:"guitarra")}

  let(:banda) {Band.create!(name: "band of shill",mail:"shill@example.com",creator: user)}

  let(:vacancy) {Vacancy.create!(band: banda, instrument: guitarra)}

  before(:each) do
    sign_in user
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

  end
end