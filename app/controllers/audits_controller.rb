class AuditsController < ApplicationController
  respond_to :json
  before_action :set_audit, only: [:show, :edit, :update, :destroy]

  def index
    @audits = Audit.all
    respond_with @audits
  end

  def show
  end

  def new
    @audit = Audit.new
  end

  def edit
  end

  def create
    @audit = Audit.new(audit_params)
    @audit.save ? (redirect_to @audit, notice: 'Audit was successfully created.') : (render :new)
  end

  def update
    @audit.update(audit_params) ? (redirect_to @audit, notice: 'Audit was successfully updated.') : (render :edit)
  end

  def destroy
    @audit.destroy
    redirect_to audits_url, notice: 'Audit was successfully destroyed.'
  end

  private
    def set_audit
      @audit = Audit.find(params[:id])
    end

    def audit_params
      # params.require(:audit).permit(:body, :post_id)
    end
end
