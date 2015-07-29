require "rails_helper"
# RSpec.describe SessionsController, :type => :controller do

  # let (:some_test_user) {User.create!(username:'bagoftricks', password: '123456', first_name: "bagof", last_name: "tricks")}

describe "A user can log in", :type => :feature do
  before :each do
    User.create!(:username => 'user@example.com', :password => 'password', :first_name => 'obama', :last_name => 'michelle')
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(some_test_user)
  end

  it "signs me in" do
    visit '/login'
    within("form") do
      fill_in 'session[username]', :with => 'user@example.com'
      fill_in 'session[password]', :with => 'password'
    end
    click_button 'Log In'
    expect(page).to have_content 'Log'
  end
end

describe "A user can sign up", :type => :feature do
  before :each do
  end

  it "signs me up with new account" do
    visit '/users/new'
    within("form") do
      fill_in 'user[username]', :with => 'user@example.com'
      fill_in 'user[first_name]', :with => 'Panda'
      fill_in 'user[last_name]', :with => 'Poo'
      fill_in 'user[password]', :with => 'password'
    end
    click_button 'Create Account'
    expect(page).to have_content 'Username'
  end
end

# describe "A user can log out" do

#   delete :destroy, id: some_test_user.id
#   expect(current_user).to be(nil)
# end


# end
