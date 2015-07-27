require "rails_helper"

describe "A user can log in", :type => :feature do
  before :each do
    User.create!(:username => 'user@example.com', :password => 'password', :first_name => 'obama', :last_name => 'michelle')
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


