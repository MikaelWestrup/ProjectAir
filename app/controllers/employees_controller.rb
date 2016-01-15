class EmployeesController < ApplicationController
  respond_to :json

  def conpanies_list
    @companies = Company.all
    respond_with @companies
  end

  def departments_list
    @departments = Company.find(params[:id]).departments
    respond_with @departments.as_json()
  end

  def audit_types_list
    @audit_types = AuditType.where(is_parent: true)
    respond_with @audit_types.as_json(include: :sub_types)
  end
end
