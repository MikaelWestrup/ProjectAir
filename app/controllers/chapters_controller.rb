class ChaptersController < ApplicationController
  before_filter :search, only: :index
  
  respond_to :json

  def index  
    respond_with @chapters.as_json(include: :paragraphs)
  end

  private
    def search
      @chapters = Chapter.ransack(name_cont: params[:q]).result
    end
end
