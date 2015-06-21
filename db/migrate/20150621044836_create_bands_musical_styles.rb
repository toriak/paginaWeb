class CreateBandsMusicalStyles < ActiveRecord::Migration
  def change
    create_table :bands_musical_styles do |t|
      t.integer :band_id
      t.integer :musical_style_id
    end
    add_index(:bands_musical_styles, [:band_id, :musical_style_id])
  end
end
