class OxfordService
  def initialize(word)
    @word = word
  end

  def grab_word
    if call_word == '404 Not Found'
      '404 Not Found'
    else
      call_word[:'results'].first[:"lexicalEntries"].first[:"inflectionOf"].first[:'text']
    end
  end

  def call_word
    @word_info ||= get_json
  end

  private

  def conn
    Faraday.new(url: "https://od-api.oxforddictionaries.com/api/v1/inflections/en/#{@word}") do |faraday|
      faraday.headers["app_id"] = ENV['APP_ID']
      faraday.headers["app_key"] = ENV['APP_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json
    if conn.get.body.include?('404 Not Found')
      '404 Not Found'
    else
      JSON.parse(conn.get.body, symbolize_names: true)
    end
  end
end
