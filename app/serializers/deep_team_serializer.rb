class DeepTeamSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :players, serializer: PlayerSerializer
end