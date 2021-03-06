class Team < ApplicationRecord
  validates_presence_of :name 
  belongs_to :season
  has_many :players
  has_many :home_games, class_name: 'Game', foreign_key: 'home_team_id'
  has_many :away_games, class_name: 'Game', foreign_key: 'away_team_id'
end