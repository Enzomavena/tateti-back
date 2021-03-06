class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.integer :counter_turn, default: 0
      t.integer :turn_player, default: 1
      t.string :result
      t.references :player_one, foreign_key: {to_table: 'users'} 
      t.references :player_two, foreign_key: {to_table: 'users'}
      t.timestamps
    end
  end
end
