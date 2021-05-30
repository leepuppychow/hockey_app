class CreatePlayers < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE DOMAIN player_position VARCHAR(2)
        CHECK (VALUE IN ('F', 'D', 'C', 'RW', 'LW', 'RD', 'LD'));
      CREATE DOMAIN captain_status VARCHAR(2)
        CHECK (VALUE IN ('C', 'A', 'NA'));
    SQL

    create_table :players do |t|
      t.string :name
      t.string :email
      t.integer :number
      t.column :position, :player_position
      t.column :captain_status, :captain_status
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :players
    execute "DROP DOMAIN player_position"
    execute "DROP DOMAIN captain_status"
  end
end
