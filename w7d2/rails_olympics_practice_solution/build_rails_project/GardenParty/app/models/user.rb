class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  
  has_many :flowers,
  primary_key: :id,
  foreign_key: :gardener_id,
  class_name: 'Flower'


  has_many :gardens,
  primary_key: :id,
  foreign_key: :garden_owner_id,
  class_name: 'Garden'

  #  find all the flowers (whether they belong to this user or not)
  #  that are in this user's gardens
  has_many :flowers_in_all_gardens,
  through: :gardens,
  source: :flowers

  #  find all the gardens that has this user's flowers
  has_many :gardens_with_my_flowers,
  through: :flowers,
  source: :garden


end
