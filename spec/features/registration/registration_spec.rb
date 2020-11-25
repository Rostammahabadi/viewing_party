require 'rails_helper'

RSpec.describe 'Registration page' do
  describe "when i visit /registration" do
    before :each do 
      visit '/registration'
    end

    it 'should show a form with email, password, password confirmation, and a register button' do
      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
      expect(page).to have_content("password confirmation")
      expect(page).to have_button("Submit")
    end

    it 'should submit and redirect to dashboard' do
      fill_in 'Email', with: 'asdf@gmail.com'
      fill_in 'Password', with: 'asdfasdf'
      fill_in 'password confirmation', with: 'asdfasdf'
      click_on 'Submit'
      expect(current_path).to eq('/dashboard')
    end

    it 'should error out if the Email is taken' do
      @user = User.create(email: 'asdf@gmail.com', password: 'asdfasdf', password_confirmation: 'asdfasdf')
      fill_in 'Email', with: 'asdf@gmail.com'
      fill_in 'Password', with: 'asdfasdf'
      fill_in 'password confirmation', with: 'asdfasdf'
      click_on 'Submit'
      expect(current_path).to eq('/registration')
      expect(page).to have_content('Email has already been taken')
    end

    it 'should error out if the passwords do not match' do
      fill_in 'Email', with: 'asdf@gmail.com'
      fill_in 'Password', with: 'asdfasdf'
      fill_in 'password confirmation', with: 'fsdaasdf'
      click_on 'Submit'
      expect(page).to have_content("Password confirmation doesn't match Password and Password confirmation doesn't match Password")
    end

    it 'should error out if the password isnt at least 6 characters' do
      fill_in 'Email', with: 'asdf@gmail.com'
      fill_in 'Password', with: 'asdf'
      fill_in 'password confirmation', with: 'asdf'
      click_on 'Submit'
      expect(page).to have_content("Password is too short (minimum is 6 characters)")
    end

  end
end
