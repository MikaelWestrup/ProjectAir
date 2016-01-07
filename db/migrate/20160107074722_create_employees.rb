class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.text :address
      t.string :office_phone
      t.string :cell_phone
      t.string :email
      t.string :role
      t.integer :company_id
      t.integer :department_id
      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_updated_at

      t.timestamps null: false
    end
  end
end
