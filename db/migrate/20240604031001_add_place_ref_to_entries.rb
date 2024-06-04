class AddPlaceRefToEntries < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:entries, :place_id)
      add_reference :entries, :place, foreign_key: true
    end
  end
end


