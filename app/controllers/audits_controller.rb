class AuditsController < ApplicationController
  respond_to :json
  before_action :set_audit, only: [:show, :edit, :update, :destroy]
  before_action :change_date_format, only: :create

  # get collection of all stored audits
  def index
    @audits = Audit.all
    respond_with @audits
  end

  # get details of specific audit by its id
  def show
    @audit = Audit.find(params[:id])
    respond_with @audit.as_json(:include => [:location, :fine_tunes, :auditors, :auditees, :paragraphs => {only: [:id, :name]}])
  end

  # add new audit to database and its location if it's new
  def create
    # Store audit location place details if it's new
    if params[:location].present?
      @location = Location.find_by(id: params[:location][:id], name: params[:location][:name])
      @location = Location.new(location_params) if @location.blank?
      @audit = @location.audits.build(audit_params) if @location.save
    end
    # Initialize new audit object for validation
    @audit ||= Audit.new(audit_params)
    
    # save newly created audit object if it's valid
    if @audit.save
      # save paragraphs details which are involved in audit
      params[:audit][:paragraphs].each { |pa| @audit.audit_items.build(paragraph_id: pa).save } if params[:audit][:paragraphs].present?
      # save auditors details how will conduct audit
      params[:audit][:auditors].each { |employee| @audit.auditor_employees.build(employee_id: employee).save } if params[:audit][:auditors].present?
      # save auditees details how help in audit
      params[:audit][:auditees].each { |employee| @audit.auditee_employees.build(employee_id: employee).save } if params[:audit][:auditees].present?
      # save shadule details for audit paragraphs, when they will be conducted
      params[:audit][:fine_tunes].each do |fine_tune|
        if fine_tune[:date] && fine_tune[:start_time][:hour] && fine_tune[:start_time][:min] && fine_tune[:end_time][:hour] && fine_tune[:end_time][:min] && fine_tune[:paragraph]
          @audit.fine_tunes.build( ddate: Date.strptime(fine_tune[:date], "%m/%d/%Y"),
            start_hour: change_time(fine_tune[:start_time][:hour], fine_tune[:start_time][:min]),
            end_hour: change_time(fine_tune[:end_time][:hour], fine_tune[:end_time][:min]),
            notes: fine_tune[:note], paragraph_id: fine_tune[:paragraph]
          ).save
        end
      end if params[:audit][:fine_tunes].present?
      render json: @audit, status: :created
    else
      render json: @audit.errors, status: :unprocessable_entity
    end
  end

  # Delete/destroy any audit by its id
  def destroy
    Audit.find(params[:id]).destroy
    head :no_content
  end

  private
    # Find an audit by its id parameter
    def set_audit
      @audit = Audit.find(params[:id])
    end

    # Change date format before save bco'z frontend angular date format is different
    def change_date_format
      params[:audit][:period_start] = DateTime.strptime(params[:audit][:period_start], "%m/%d/%Y %H:%M")
      params[:audit][:period_end] = DateTime.strptime(params[:audit][:period_end], "%m/%d/%Y %H:%M")
    end

    # Convert string time values to actual time datatype value
    def change_time(hour,min)
      Time.strptime("#{hour}:#{min}", "%H:%M")
    end

    # Filter authorized and unauthorizred parameters for storing new audit record
    def audit_params
      params.require(:audit).permit(:name, :reoccuring, :onsite, :notes, :audit_type_id, :interval, :period_start, :period_end)
    end

    # Filter authorized and unauthorizred parameters for storing new location record
    def location_params
      params.require(:location).permit(:name, :country, :airport, :address, :zipcode, :town, :additional_details)
    end
end
