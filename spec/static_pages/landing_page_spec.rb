require 'rails_helper'

feature 'landing page' do
  scenario 'welcome message' do
    visit('/')
    expect(page).to have_content('Legit')
    expect(page).to have_content('Review a Company')
  end
end