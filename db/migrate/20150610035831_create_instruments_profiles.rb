class CreateInstrumentsProfiles < ActiveRecord::Migration
  def change
    create_table :instruments_profiles do |t|
      t.integer :instrument_id
      t.integer :profile_id
    end
    add_index(:instruments_profiles, [:instrument_id, :profile_id])
  end
end
