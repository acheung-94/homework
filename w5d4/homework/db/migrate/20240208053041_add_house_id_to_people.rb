class AddHouseIdToPeople < ActiveRecord::Migration[7.0]
  def change
    add_reference :people, :house, foreign_key: true
  end
end
