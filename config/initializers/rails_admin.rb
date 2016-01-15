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
    edit do
      field :name
      field :organization
    end
  end

  config.model 'Chapter' do 
    edit do
      exclude_fields :code, :paragraphs
    end
  end

  config.model 'Paragraph' do 
    edit do
      exclude_fields :number, :audit_items, :audits #, :attachments
    end
  end

  config.model 'Attachment' do 
    edit do
      exclude_fields :attachment_type_id
    end
  end

  config.model 'AuditType' do 
    edit do
      exclude_fields :sub_types, :audits
    end
  end

  config.model 'Audit' do 
    edit do
      exclude_fields :auditor_id, :auditee_id, :fine_tunes, :audit_items
    end
  end

  config.model 'Company' do 
    edit do
      exclude_fields :departments
    end
  end

  config.model 'Department' do 
    edit do
      exclude_fields :employees
    end
  end
end