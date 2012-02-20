class AddDirectorToLabs < ActiveRecord::Migration
  def change
    add_column :labs, :director_name, :string

    add_column :labs, :director_email, :string

  end
end
