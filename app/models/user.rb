class User < ApplicationRecord
  has_many :providers
  has_many :people
end
