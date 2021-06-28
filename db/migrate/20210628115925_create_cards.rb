class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.integer :card_id
      t.integer :color
      t.integer :shape
      t.integer :filling
      t.integer :number
      t.string :bit_id
      t.string :card_name

      t.timestamps
    end
  end
end
