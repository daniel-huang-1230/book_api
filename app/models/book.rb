class Book < ApplicationRecord
  belongs_to :publisher
  has_many :shops, :through => :distributions
end
