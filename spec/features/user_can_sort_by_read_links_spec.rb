require 'rails_helper'

feature "user can sort by read without reloading" do 
  scenario "when #findRead is clicked, unread are hidden and read are show", js: true do 
    user = User.create(email: "jon@jon.com", password: "password", password_confirmation: "password")

    link_1 = user.links.create(title: 'unread', url: "http://example.com")

    link_2 = user.links.create(title: 'test2', url: "http://google.com", read: :true)
    
    visit root_path

    within(".sign-in-form") do 
      fill_in "Email", with: "jon@jon.com"
      fill_in "Password", with: "password"
      click_on "Sign In" 
    end

    visit links_path

    expect(current_path).to eq links_path
  
    find("#findRead").click

    within(".links") do 
      expect(page).not_to have_content "unread"
      expect(page).to have_content "test2"
    end 
  end 
end 
    