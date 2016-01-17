class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :mobile_no, default: ''
      t.text :cv

      t.timestamps null: false
    end
  end
end
