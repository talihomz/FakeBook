require 'rails_helper'
require 'capybara/rails'

feature 'Visitor log in' do
  # subject(:email) { 'johndoe@test.com' }
  # subject(:password) { 'password123' }

  # before :each do
  #   User.create(email: email, password: password)
  # end

  fixtures :users
  subject(:email) {users(:one).email}
  subject(:password) {users(:one).password}

  scenario 'with valid username and password' do
    log_in_with email, password

    expect(page).to have_content('Find Friends')
  end

  def log_in_with(email, password)
    visit unauthenticated_root_path
    
    within("#log-in") do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
    end
    
    click_button 'Log In'
  end
end