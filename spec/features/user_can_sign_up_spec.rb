require 'rails_helper'

feature 'User Can Sign Up' do 
  scenario 'user sees a link on the root page to sign up' do 
    
    visit root_path

    expect(page).to have_content "Sign Up"

    end

    scenario 'user is brought to correct page and can sign up for the site' do 

    visit root_path

    click_on "Sign Up"

    expect(current_path).to eq new_user_path

    within(".sign-up-form") do 
      fill_in "Email", with: "jon@jon.com"
      fill_in "Password", with: "password"
      fill_in "Password Confirmation", with: "password"
      click_on "Create Account" 
    end 

    user = User.find_by(email: "jon@jon.com")
    expect(page).to have_content "Success, Please Login"
    expect(current_path). to eq login_path
    expect(user).to eq User.last 

  end 

  scenario 'user can not login if user enters different password and confirmation' do 

  visit new_user_path

   within(".sign-up-form") do 
      fill_in "Email", with: "jon@jon.com"
      fill_in "Password", with: "password"
      fill_in "Password Confirmation", with: "nope"
      click_on "Create Account" 
    end 

    user = User.find_by(email: "jon@jon.com")
    expect(page).to have_content "Error"
    expect(current_path).to eq new_user_path
    expect(user).to eq nil

  end 
end 
  
