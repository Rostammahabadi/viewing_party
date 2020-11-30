require 'rails_helper'

RSpec.describe "welcome screen" do
  describe "when a user visits the root path" do
    before :each do 
      visit "/"
    end

    it 'should see a welcome message' do 
      expect(page).to have_content('Welcome to Viewing Party')
    end

    it 'should have a brief description of the application' do
      expect(page).to have_content('Brief description of application')
    end

    it 'should have a button to login' do
      expect(page).to have_button('Log in')
    end

    it 'should have a link to registration' do
      expect(page).to have_link('New to Viewing Party? Register Here')
      click_on('New to Viewing Party? Register Here')
      expect(current_path).to eq('/registration')
    end
  end
end
