class Player < ApplicationRecord
  validates_presence_of :name
  belongs_to :team
  has_many :goals
  has_many :assists
end