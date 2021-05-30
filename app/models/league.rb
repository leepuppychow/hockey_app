class League < ApplicationRecord
  validates_presence_of :name
  has_many :seasons
end