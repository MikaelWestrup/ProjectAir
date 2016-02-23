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

  def list_chapter_type
    @ctypes = Chapter.order(ctype: :asc).pluck(:ctype).uniq
    respond_with @ctypes.as_json
  end

  private
    def search
      chapters = Chapter.ransack(name_cont: params[:q]).result
      paragraphs = Paragraph.ransack(name_or_description_cont: params[:q]).result
      paragraph_chapters = Chapter.where(id: paragraphs.map(&:chapter_id).uniq)
      chapters_list = (chapters + paragraph_chapters).uniq
      if params[:filter].present?
        filter_chapter = Chapter.ransack(ctype_cont: params[:filter]).result
        @chapters = []
        chapters_list.each {|chapter| @chapters.push(chapter) if filter_chapter.include?(chapter)}
      else
        @chapters = chapters_list
      end
      @chapters
    end
end
