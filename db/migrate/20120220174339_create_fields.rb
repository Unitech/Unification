class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :title
      t.string :content
      t.references :lab

      t.timestamps
    end
  end
end
