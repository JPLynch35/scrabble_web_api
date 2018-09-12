require 'rails_helper'

describe OxfordService do
  it 'exists' do
    word = 'dogs'
    service = OxfordService.new(word)

    expect(service).to be_an(OxfordService)
  end
  describe 'instance methods' do
    it 'can retrieve information if word is valid' do
      word = 'dogs'
      service = OxfordService.new(word)

      expect(service.call_word).to be_a(Hash)
      expect(service.call_word[:'results']).to be_an(Array)
      expect(service.call_word[:'results'].first).to be_a(Hash)
      expect(service.call_word[:'results'].first[:"lexicalEntries"]).to be_an(Array)
      expect(service.call_word[:'results'].first[:"lexicalEntries"].first[:"inflectionOf"]).to be_an(Array)
      expect(service.call_word[:'results'].first[:"lexicalEntries"].first[:"inflectionOf"].first).to have_key(:text)
    end
    it 'can grab the base word if valid' do
      word = 'dogs'
      service = OxfordService.new(word)

      expect(service.grab_word).to eq('dog')
    end
  end
end
