class EmployeesController < ApplicationController
  respond_to :json

  def conpanies_list
    @companies = Company.all
    respond_with @companies.as_json(include: :departments)
  end

  def departments_list
    @departments = Company.find(params[:id]).departments
    respond_with @departments.as_json()
  end

  def employees_list
    @employees = Employee.all
    respond_with @employees.as_json()
  end

  def auditee_employees_list
    department = Department.find(params[:id])
    @auditee_employees = department.employees
    respond_with @auditee_employees.as_json()
  end
end
