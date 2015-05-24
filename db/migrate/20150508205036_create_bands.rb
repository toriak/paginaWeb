class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name
      t.date :creation_date
      t.string :mail

      t.timestamps
    end
  end
end
