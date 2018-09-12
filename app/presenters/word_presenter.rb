class WordPresenter
  def initialize(word)
    @word = word
    @service = OxfordService.new(word)
  end

  def word_check
    if service.grab_word == '404 Not Found'
      "'#{word}' is not a valid word."
    else
      "'#{word}' is a valid word and its root form is '#{service.grab_word}'."
    end
  end

  private
  attr_reader :service, :word
end
