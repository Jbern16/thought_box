require 'rails_helper'

feature "authenticated user can submit new link to main page" do 
  scenario "as an authenticated user, I should see a form to submit a link" do 
    user = User.create(email: "jon@jon.com", password: "password", password_confirmation: "password")
      
      visit root_path


      within(".sign-in-form") do 
        fill_in "Email", with: "jon@jon.com"
        fill_in "Password", with: "password"
        click_on "Sign In" 
      end

      visit links_path 

      expect(current_path).to eq links_path 

      within(".new-link-form") do 
        fill_in "Url", with: "http://example.com"
        fill_in "Title", with: "test"
        click_on "Create Link"
      end 

      link = Link.find_by(title: "test")
      expect(link.url).to eq "http://example.com"
      expect(link.title).to eq "test"
      expect(link.read).to eq false

      expect(current_path).to eq links_path

      within("#link-#{link.id}") do 
        expect(page).to have_content "http://example.com"
        expect(page).to have_content "test"
      end 
    end
    
    scenario "as a unauthenticated user, I can not view the my links or create new ones" do 
      visit links_path
      expect(page).to have_content "404"
    end 

    scenario "invalid url should not be saved" do 

      user = User.create(email: "jon@jon.com", password: "password", password_confirmation: "password")

      visit root_path

      within(".sign-in-form") do 
        fill_in "Email", with: "jon@jon.com"
        fill_in "Password", with: "password"
        click_on "Sign In" 
      end


      within(".new-link-form") do 
        fill_in "Url", with: "example.com"
        fill_in "Title", with: "test"
        click_on "Create Link"
      end 

      expect(current_path).to eq links_path
      within(".error") do 
        expect(page).to have_content "Link Not Valid"
      end 

      expect(Link.find_by(title: "test")).to eq nil
    end 
  end   
  

