class ChangeGamesCurrentCards < ActiveRecord::Migration[6.1]
  def up
    change_table :games do |t|
      t.change :current_cards, :integer, array: true , default: [], using: 'array[current_cards]::integer[]'
    end
  end

  def down
    change_table :games do |t|
      t.change :current_cards, :integer
    end
  end

  
end
