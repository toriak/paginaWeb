require "rails_helper"
require "spec_helper"

RSpec.describe "Profile", type: :request do

  describe "Edit profile" do
    it "Edit profile and display the results" do
      visit root_path
      click_link 'Registrar'
      fill_in 'user_email', with: "raulito@example.com"
      fill_in 'user_password', with: "12345678"
      fill_in 'user_password_confirmation', with: "12345678"
      click_button "Sign up"
      page.should have_content "Welcome! You have signed up successfully."

      click_link 'Mi Perfil'
      click_link 'Editar'
      page.should have_content "Edit Profile"

      fill_in 'profile_name', with: "Rauliño"
      select '1994', :from => 'profile_birth_date_1i'
      select 'May', :from => 'profile_birth_date_2i'
      select '1', :from => 'profile_birth_date_3i'
      click_button "Actualizar Perfil"
      page.should have_content "Rauliño"
      page.should have_content "raulito@example"
      page.should have_content "Se actualizo los datos correctamente"
      page.should have_content "1994-05-01"
    end

    it "Edit profile with one error and return a edit" do
      visit root_path
      click_link 'Registrar'
      fill_in 'user_email', with: "raulito@example.com"
      fill_in 'user_password', with: "12345678"
      fill_in 'user_password_confirmation', with: "12345678"
      click_button "Sign up"
      page.should have_content "Welcome! You have signed up successfully."

      click_link 'Mi Perfil'
      click_link 'Editar'
      page.should have_content "Edit Profile"

      fill_in 'profile_name', with: ""
      select '1994', :from => 'profile_birth_date_1i'
      select 'May', :from => 'profile_birth_date_2i'
      select '1', :from => 'profile_birth_date_3i'
      click_button "Actualizar Perfil"
      page.should have_content "raulito@example"
      page.should have_content "Ha ocurrido un error en la actualizacion"
    end
  end

end