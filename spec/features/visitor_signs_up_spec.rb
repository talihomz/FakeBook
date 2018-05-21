require 'rails_helper'
require 'capybara/rails'

feature 'Visitor Sign Up' do
  subject(:email) { 'johndoe@test.com' }
  subject(:password) { 'password123' }

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
    fill_in 'Account Email', with: email
    fill_in 'Account Password', with: password
    fill_in 'Confirm Password', with: password
    click_button 'Sign Up'
  end
end