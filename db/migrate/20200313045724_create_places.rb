class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.text :notes
      t.integer :user_id
    end
  end
end
