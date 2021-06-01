class PlayerSerializer < ActiveModel::Serializer
  attributes :id,
            :name,
            :email,
            :number,
            :position,
            :captain_status
end