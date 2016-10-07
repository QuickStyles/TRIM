class User < ApplicationRecord
  belongs_to :person, polymorphic: true
end
