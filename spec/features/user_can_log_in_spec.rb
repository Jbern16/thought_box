require 'rails_helper'

feature "User Can Login" do 
  scenario "they see a link to sign-in on root path" do 
    
    visit root_path

    expect(page).to have_content 'Sign In'

    end

    scenario "when they click on the sign in they are taken to a page to enter their username and password" do 

      user = User.create(email: "jon@jon.com", password: "password", password_confirmation: "password")

      visit root_path

      click_on "Sign In"

      expect(current_path).to eq login_path

      within(".sign-in-form") do 
        fill_in "Email", with: "jon@jon.com"
        fill_in "Password", with: "password"
        click_on "Sign In" 
      end 

      expect(current_path).to eq user_path(user)
      expect(page).to have_content "Success - Welcome"

    end 

    scenario "when username and password are wrong, they see an error" do 

      user = User.create(email: "jon@jon.com", password: "password", password_confirmation: "password")

      visit root_path

      click_on "Sign In"

      expect(current_path).to eq login_path

      within(".sign-in-form") do 
        fill_in "Email", with: "jon@jon.com"
        fill_in "Password", with: "nope"
        click_on "Sign In" 
      end 

      expect(current_path).to eq login_path
      expect(page).to have_content "Incorrect Email/Password"
    end 
  end 

