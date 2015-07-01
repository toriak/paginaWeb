class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.integer :band_id
      t.integer :instrument_id

      t.timestamps
    end
  end
end
