RailsAdmin.config do |config|
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end

Rails.application.eager_load!
RailsAdmin.config do |config|
  ActiveRecord::Base.descendants.each do |imodel|
    config.model "#{imodel.name}" do
      list do
        exclude_fields :id, :created_at, :updated_at
      end
    end
  end
end

RailsAdmin.config do |config|
  config.model 'Regulation' do 
    hide_fields
    edit do
      field :name
      field :organization
    end
  end

  config.model 'Chapter' do 
    hide_fields
    list do
      exclude_fields :code
    end
    edit do
      exclude_fields :code, :paragraphs
    end
  end

  config.model 'Paragraph' do 
    hide_fields
    list do
      exclude_fields :number
    end
    edit do
      exclude_fields :number, :audit_items, :audits #, :attachments
    end
  end

  config.model 'Attachment' do 
    hide_fields
    list do
      exclude_fields :number
    end
    edit do
      exclude_fields :number
    end
  end

  config.model 'AttachmentType' do 
    hide_fields
    edit do
      exclude_fields :attachments
    end
  end

  config.model 'AuditType' do 
    hide_fields
    edit do
      exclude_fields :sub_types, :audits
    end
  end

  config.model 'Audit' do 
    hide_fields
    list do
      exclude_fields :auditor_employees, :auditee_employees, :fine_tunes, :audit_items, :onsite, :reoccuring,
        :auditors, :auditees, :notes, :planner, :interval
    end
    edit do
      exclude_fields :auditor_employees, :auditee_employees, :fine_tunes, :audit_items, :onsite, :reoccuring
    end
  end

  config.model 'Company' do 
    hide_fields
    list do
      exclude_fields :code
    end
    edit do
      exclude_fields :departments
    end
  end

  config.model 'Department' do 
    hide_fields
    list do
      exclude_fields :code
    end
    edit do
      exclude_fields :employees
    end
  end

  config.model 'Employee' do
    hide_fields
    list do
      exclude_fields :audits, :auditor_employees, :auditee_employees, :role
    end
    edit do
      exclude_fields :audits, :auditor_employees, :auditee_employees
    end
  end

  private
    def hide_fields
      list do
        exclude_fields :id, :created_at, :updated_at
      end
    end
end