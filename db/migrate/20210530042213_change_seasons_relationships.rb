class ChangeSeasonsRelationships < ActiveRecord::Migration[6.1]
  def change
    remove_column :games, :season_id, :integer
    remove_column :teams, :league_id, :integer
    remove_column :leagues, :rink_name, :string

    add_column :seasons, :league_id, :integer
    add_foreign_key :seasons, :leagues

    add_column :teams, :season_id, :integer
    add_foreign_key :teams, :seasons
  end
end
