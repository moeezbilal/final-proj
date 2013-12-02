class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :job_title
      t.string :company_name
      t.string :zip_code
      t.string :country
      t.integer :status
      t.string :school
      t.references :user

      t.timestamps
    end
    add_index :experiences, :user_id
  end
end
