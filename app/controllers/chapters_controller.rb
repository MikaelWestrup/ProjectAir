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
      if params[:filter] == "Regulation"
        regulations = Regulation.ransack(name_cont: params[:q]).result
        @chapters = Chapter.where(regulation_id: regulations.map(&:id))
      end
      if params[:filter] == "Chapter" || params[:filter].blank?
        @chapters = Chapter.ransack(name_cont: params[:q]).result
      end
      if params[:filter] == "Paragraph"
        paragraphs = Paragraph.ransack(name_cont: params[:q]).result
        @chapters = Chapter.where(id: paragraphs.map(&:chapter_id).uniq)
      end
    end
end
