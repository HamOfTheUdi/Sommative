class Voiture < ApplicationRecord
  belongs_to :garage
  belongs_to :proprietaire
end
