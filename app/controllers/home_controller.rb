class HomeController < ApplicationController
  respond_to :json, except: :index

  def index
  end

  def audit_types_list
    @audit_types = AuditType.where(is_parent: true)
    respond_with @audit_types.as_json(include: :sub_types)
  end

  def location_list
    @locations = Location.all
    respond_with @locations.as_json()
  end
end
