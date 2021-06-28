# frozen_string_literal: true

class CreateGameSets < ActiveRecord::Migration[6.1]
  def change
    create_table :game_sets do |t|
      t.integer :cards, array: true
      t.datetime :created_time
      t.references :game
      t.timestamps
    end
  end
end
