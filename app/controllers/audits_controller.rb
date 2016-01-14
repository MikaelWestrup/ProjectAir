class AuditsController < ApplicationController
  respond_to :json
  before_action :set_audit, only: [:show, :edit, :update, :destroy]

  def index
    @audit_types = AuditType.where(is_parent: true)
    respond_with @audit_types.as_json(include: :sub_types)
  end

  def show
  end

  def edit
  end

  def create
    @audit = Audit.new(filter_params)
    if @audit.save
      render json: @audit, status: :created
    else
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

    def filter_params
      data = { :name => params[:name], :audit_type_id => params[:audit_type].to_i, :period_start => DateTime.parse(params[:period_start]),
        :period_end => DateTime.parse(params[:period_end]), :interval => params[:interval].to_i, :notes => params[:notes],
        :reoccuring => params[:reoccuring]=='true' ? true : false }
    end

    # def audit_params
    #   params[:period_start] = DateTime.parse(params[:period_start])
    #   params[:period_end] = DateTime.parse(params[:period_end])
    #   params.permit(:name, :reoccuring, :period_start, :period_end, :notes, :audit_type, :interval)
    # end
end
