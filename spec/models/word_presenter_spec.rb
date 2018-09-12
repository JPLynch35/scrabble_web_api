require 'rails_helper'

describe WordPresenter do
  it 'exists' do
    word = 'dog'
    presenter = WordPresenter.new(word)

    expect(presenter).to be_a(WordPresenter)
  end
  describe 'instance methods' do
    it 'can validate that a word is indeed a real word' do
      word = 'dogs'
      presenter = WordPresenter.new(word)

      expected_phrase = "'dogs' is a valid word and its root form is 'dog'."

      expect(presenter.word_check).to eq(expected_phrase)
    end
    it 'can validate that a word is not a real word' do
      word = 'dogz'
      presenter = WordPresenter.new(word)

      expected_phrase = "'dogz' is not a valid word."

      expect(presenter.word_check).to eq(expected_phrase)
    end
  end
end
