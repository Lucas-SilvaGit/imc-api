class Imc < ApplicationRecord
  # validations
  validates_presence_of :height, :weight
end
