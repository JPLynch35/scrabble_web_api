class WelcomeController < ApplicationController
  def index
    word = params[:word]
    presenter = WordPresenter.new(word)
  end
end
