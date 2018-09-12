require 'rails_helper'

describe 'a user' do
  describe 'visiting the root page' do
    it 'can validate that a word exists' do
      visit root_path

      fill_in :word, with: 'foxes'
      click_on 'Validate Word'

      expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'.")
    end
    it 'can validate that a word does not exist' do
      visit root_path
      fill_in :word, with: 'foxez'
      click_on 'Validate Word'

      expect(page).to have_content("'foxez' is not a valid word.")
    end
  end
end
