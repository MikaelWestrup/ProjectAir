class AuditsController < ApplicationController
  respond_to :json
  before_action :set_audit, only: [:show, :edit, :update, :destroy]

  def index
    @audits = Audit.all
    respond_with @audits
  end

  def show
  end

  def edit
  end

  def create
    @location = Location.find_by(id: params[:location][:id], name: params[:location][:name])
    @location = Location.new(location_params) if @location.blank?
    if @location.save
      @audit = @location.audits.build(audit_params)
      if @audit.save
        params[:audit][:paragraphs].each { |pa| @audit.audit_items.build(paragraph_id: pa).save }
        render json: @audit, status: :created
      else
        @location.destroy
        render json: @audit.errors, status: :unprocessable_entity
      end
    else
      @location.errors.each {|error| @audit.errors.add(error)}
      render json: @audit.errors, status: :unprocessable_entity
    end
  end

  def update
    # @audit.update(audit_params) ? (redirect_to @audit, notice: 'Audit was successfully updated.') : (render :edit)
  end

  def destroy
    # @audit.destroy
    # redirect_to audits_url, notice: 'Audit was successfully destroyed.'
  end

  private
    def set_audit
      @audit = Audit.find(params[:id])
    end

    def audit_params
      params.require(:audit).permit(:name, :reoccuring, :onside, :notes, :audit_type_id, :interval, :period_start, :period_end)
    end

    def location_params
      params.require(:location).permit(:name, :country, :airport, :address, :zipcode, :town, :additional_details)
    end
end
