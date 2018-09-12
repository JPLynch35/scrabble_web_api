class WordsController < ApplicationController
  def show
    word = params[:word]
    @presenter = WordPresenter.new(word)
  end
end
