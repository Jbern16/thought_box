module LoginHelper
  def login_and_create_user
    user = User.create(email: "jon@jon.com", password: "password", password_confirmation: "password")

    visit login_path
    
    within(".sign-in-form") do 
      fill_in "Email", with: "jon@jon.com"
      fill_in "Password", with: "nope"
      click_on "Sign In" 
    end
  end 

  RSpec.configure do |config|
    config.include LoginHelper
  end 

end 