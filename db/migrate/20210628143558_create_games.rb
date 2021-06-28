class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.uuid :game_id
      t.integer :num_of_players
      t.datetime :start_time
      t.datetime :end_time
      t.integer :deck , array: true 
      t.integer :deck_offset
      t.integer :current_cards

      t.timestamps
    end
  end
end
