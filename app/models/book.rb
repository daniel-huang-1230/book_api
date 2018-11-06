class Book < ApplicationRecord
  belongs_to :publisher
  has_many :distributions, dependent: :destroy
  has_many :shops, :through => :distributions
end
