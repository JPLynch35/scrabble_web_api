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
      expect(service.call_word[:'results']).first).to be_a(Hash)
      expect(service.call_word[:'results'][:"lexicalEntries"]).to be_an(Array)
      expect(service.call_word[:'results'][:"lexicalEntries"].first[:"inflectionOf"]).to be_an(Array)
      expect(service.call_word[:'results'][:"lexicalEntries"].first[:"inflectionOf"].first).to have_key(:text)
    end
  end
end
