require 'rails_helper'

feature "user can log out" do
  scenario "when logged in, a user can log out" do 

      user = User.create(email: "jon@jon.com", password: "password", password_confirmation: "password")


      visit login_path
      
      expect(current_path).to eq login_path

      within(".sign-in-form") do 
        fill_in "Email", with: "jon@jon.com"
        fill_in "Password", with: "password"
        click_on "Sign In" 
      end 

      expect(page).to have_content "Sign Out"
      
      click_on "Sign Out"
      
      within(".success") do 
        expect(page).to have_content "Success You have Been Logged Out"
      end 

      visit user_path(user)

      expect(page).to have_content "404"
    end
  end  