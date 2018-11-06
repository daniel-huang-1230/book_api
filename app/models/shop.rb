class Shop < ApplicationRecord
  has_many :books, :through => :distributions
end
