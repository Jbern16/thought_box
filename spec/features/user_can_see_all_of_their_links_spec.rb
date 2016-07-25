require 'rails_helper'

feature "User Can See All Of Their Links" do 
    scenario "I can visit my links and see them" do 
    
      user = User.create(email: "jon@jon.com", password: "password", password_confirmation: "password")

      link_1 = user.links.create(title: 'test', url: "http://example.com")

      link_2 = user.links.create(title: 'test2', url: "http://google.com")
      
      visit root_path


      within(".sign-in-form") do 
        fill_in "Email", with: "jon@jon.com"
        fill_in "Password", with: "password"
        click_on "Sign In" 
      end

      within(".links") do 
        expect(page).to have_content "test"
        expect(page).to have_content "http://example.com"
        expect(page).to have_content "test2"
        expect(page).to have_content "http://google.com"
      end 
    end
  end 
