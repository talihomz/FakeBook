require 'rails_helper'
require 'capybara/rails'

feature 'Visitor Sign Up' do
  fixtures :users
  let(:firstname) { "John" }
  let(:lastname)  { "Doe" }
  let(:email)     { "test@fakebook.com" }
  let(:password)  { "password123" }

  scenario 'with valid email and password' do
    sign_up_with email, password

    expect(page).to have_content('Find Friend')
  end

  scenario 'with invalid email' do
    email = "johndoegmail.com"
    sign_up_with email, password

    expect(page).to have_content('Log in')
  end

  scenario 'with blank password' do
    sign_up_with email, ''

    expect(page).to have_content('Log in')
  end

  def sign_up_with(email, password)
    visit unauthenticated_root_path
    
    fill_in 'Firstname', with: 'firstname'
    fill_in 'Lastname', with: 'lastname'
    fill_in 'Account Email', with: email
    fill_in 'Account Password', with: password
    fill_in 'Confirm Password', with: password
    
    click_button 'Sign Up'
  end
end