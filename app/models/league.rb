class League < ApplicationRecord
  validates_presence_of :name, :rink_name
  has_many :teams
end