class Provider < User
  has_many :organizations
  has_many :services
end
