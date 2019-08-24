class PassengerSerializer < ActiveModel::Serializer
  attributes :id, :name, :national_id, :gender, :suspicious
end
