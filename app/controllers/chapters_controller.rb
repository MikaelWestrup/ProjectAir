class ChaptersController < ApplicationController
  before_filter :search, only: :index
  
  respond_to :json

  def index  
    respond_with @chapters.as_json(include: :paragraphs)
  end

  def show_paragraph
    @paragraph = Paragraph.find(params[:id])
    respond_with @paragraph.as_json(include: {attachments: { include: {attachment_type: {only: :name}}}})
  end

  private
    def search
      @chapters = Chapter.ransack(name_cont: params[:q]).result
    end
end
