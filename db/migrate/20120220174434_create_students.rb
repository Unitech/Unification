class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :mail
      t.string :ip
      t.references :lab
      t.timestamps
    end
  end
end
