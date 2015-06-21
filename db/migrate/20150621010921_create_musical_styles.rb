class CreateMusicalStyles < ActiveRecord::Migration
  def change
    create_table :musical_styles do |t|
      t.string :name

      t.timestamps
    end
  end
end
