require 'rails_helper'

RSpec.describe 'when i visit the dashboard page' do

  before :each do 
    @user = User.create(email: "asdf@gmail.com", password: "asdfasdf", password_digest: "asdfasdf")
  end

  it 'doesnt allow a non-logged in user to visit the page' do
    visit "/dashboard"
    expect(current_path).to eq(root_path)
    expect(page).to have_content('You must login or sign up first')
  end
  
  it 'allows a logged in user to access the page' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit "/dashboard"
    expect(current_path).to eq(dashboard_path)
  end

  it 'shows a message of Welcome and the username' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit "/dashboard"
    expect(page).to have_content('Welcome asdf@gmail.com')
  end

  it 'has a button to discover movies' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit "/dashboard"
    expect(page).to have_link('Discover Movies')
  end

  it 'has a friends section' do 
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit "/dashboard"
    expect(page).to have_css('.friends-section')
  end

  it 'has a viewing party section' do 
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit "/dashboard"
    expect(page).to have_css('.viewing-parties')
  end

  it 'when i click on the discover movies button, i am redirected to a discover page' do 
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit "/dashboard"
    click_on 'Discover Movies' 
    expect(current_path).to eq('/discover')
  end

  xit 'has a logout button which returns you back to the homepage' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit "/dashboard"
    click_on 'Logout'
    binding.pry
    expect(current_path).to eq(root_path)
  end

  xit 'doesnt allow you add a friend twice' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit "/dashboard"
  end

end