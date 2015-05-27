class AddBirthDateToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :birth_date, :Date
  end
end
