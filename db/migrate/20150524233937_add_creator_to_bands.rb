class AddCreatorToBands < ActiveRecord::Migration
  def change
    add_reference :bands, :creator, index: true
  end
end
