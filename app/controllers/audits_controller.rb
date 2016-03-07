class AuditsController < ApplicationController
  respond_to :json
  before_action :set_audit, only: [:show, :edit, :update, :destroy]
  before_action :change_date_format, only: :create

  def index
    @audits = Audit.all
    respond_with @audits
  end

  def show
    @audit = Audit.find(params[:id])
    # respond_with @audit.as_json(:include => [:location, :fine_tunes, :paragraphs => {only: [:id, :name]}])
    respond_with @audit.as_json(:include => [:location, :fine_tunes, :auditors, :auditees, :paragraphs => {only: [:id, :name]}])
  end

  def edit
  end

  def create
    if params[:location].present?
      @location = Location.find_by(id: params[:location][:id], name: params[:location][:name])
      @location = Location.new(location_params) if @location.blank?
      @audit = @location.audits.build(audit_params) if @location.save
    end
    @audit ||= Audit.new(audit_params)
    if @audit.save
      params[:audit][:paragraphs].each { |pa| @audit.audit_items.build(paragraph_id: pa).save } if params[:audit][:paragraphs].present?
      params[:audit][:auditors].each { |employee| @audit.auditor_employees.build(employee_id: employee).save } if params[:audit][:auditors].present?
      params[:audit][:auditees].each { |employee| @audit.auditee_employees.build(employee_id: employee).save } if params[:audit][:auditees].present?
      params[:audit][:fine_tunes].each do |fine_tune|
        @audit.fine_tunes.build( ddate: Date.strptime(fine_tune[:date], "%m/%d/%Y"),
          start_hour: change_time(fine_tune[:start_time][:hour], fine_tune[:start_time][:min]),
          end_hour: change_time(fine_tune[:end_time][:hour], fine_tune[:end_time][:min]),
          notes: fine_tune[:note], paragraph_id: fine_tune[:paragraph]
        ).save
      end if params[:audit][:fine_tunes].present?
      render json: @audit, status: :created
    else
      render json: @audit.errors, status: :unprocessable_entity
    end
  end

  def update
    # @audit.update(audit_params) ? (redirect_to @audit, notice: 'Audit was successfully updated.') : (render :edit)
  end

  def destroy
    Audit.find(params[:id]).destroy
    head :no_content
  end

  private
    def set_audit
      @audit = Audit.find(params[:id])
    end

    def change_date_format
      params[:audit][:period_start] = DateTime.strptime(params[:audit][:period_start], "%m/%d/%Y %H:%M")
      params[:audit][:period_end] = DateTime.strptime(params[:audit][:period_end], "%m/%d/%Y %H:%M")
    end

    def change_time(hour,min)
      Time.strptime("#{hour}:#{min}", "%H:%M")
    end

    def audit_params
      params.require(:audit).permit(:name, :reoccuring, :onsite, :notes, :audit_type_id, :interval, :period_start, :period_end)
    end

    def location_params
      params.require(:location).permit(:name, :country, :airport, :address, :zipcode, :town, :additional_details)
    end
end
