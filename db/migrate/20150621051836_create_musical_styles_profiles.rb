class CreateMusicalStylesProfiles < ActiveRecord::Migration
  def change
    create_table :musical_styles_profiles do |t|
      t.integer :musical_style_id
      t.integer :profile_id
    end
    add_index(:musical_styles_profiles, [:musical_style_id, :profile_id],
    	name: "index_styles_profiles_on_musical_style_id_and_profile_id")
  end
end
