include ApplicationHelper

<<<<<<< HEAD
def valid_signup
  fill_in "Name", with: "Example User"
  fill_in "Email", with: "user@example.com"
  fill_in "Password", with: "foobar"
  fill_in "Confirm Password", with: "foobar"
end

RSpec::Matchers.define :have_success_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-success', text: message)
  end
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end

def valid_signin(user)
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
<<<<<<< HEAD
=======
=======
end 

>>>>>>> user-microposts
def sign_in(user)
  visit signin_path
  fill_in "Email", with: user.email.upcase
  fill_in "Password", with: user.password
  click_button "Sign in"
  cookies[:remember_token] = user.remember_token
<<<<<<< HEAD
>>>>>>> updating-users
end
=======
end
>>>>>>> user-microposts
