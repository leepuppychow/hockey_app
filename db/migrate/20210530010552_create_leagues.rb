class CreateLeagues < ActiveRecord::Migration[6.1]
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :rink_name

      t.timestamps
    end
  end
end
