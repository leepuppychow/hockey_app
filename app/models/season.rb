class Season < ApplicationRecord
  validates_presence_of :name
  has_many :teams
  belongs_to :league
end