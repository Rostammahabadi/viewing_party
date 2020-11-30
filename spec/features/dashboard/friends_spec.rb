require 'rails_helper'

RSpec.describe 'on the dashboard in the friends section' do

  before :each do
    @user = User.create(email: 'asdf@gmail.com', password: 'asdfasdf', password_digest: 'asdfasdf')
  end
  
  it 'should have a text field to enter a friends email and a button to add friend' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit dashboard_path
    within '.friends-section' do
      has_field? 'email'
      has_button? 'Add Friend'
    end
  end

  xit 'should search for a friend in the data base and error out if they are not there' do 
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit dashboard_path
    fill_in :email, with: 'asdf123@gmail.com'
    click_on 'Add Friend'
    expect(page).to have_content('Could not find a user by this email')
  end

  xit 'should show a message if an authenticated user has no friends' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit dashboard_path
    User.create(email: 'asdf123@gmail.com', password: 'password', password_digest: 'password')
    page.fill_in 'email', with: 'asdf123@gmail.com'
    click_on 'Add Friend'
    expect(page).to have_content('Successfully added friend')
    within '.friends-section' do
      expect(page).to have_content('asdf123@gmail.com')
    end
  end
end