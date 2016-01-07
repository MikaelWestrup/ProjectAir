class ChaptersController < ApplicationController
  respond_to :json

  def index
    @chapters = Chapter.all
    respond_with @chapters.as_json(include: :paragraphs)
  end

  def search
    
  end
end
