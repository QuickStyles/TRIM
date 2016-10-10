class User < ApplicationRecord
  has_secure_password
  serialize :google_raw_info
  belongs_to :person, polymorphic: true

  def self.find_from_omniauth(omniauth_data)
    User.where(provider: omniauth_data['provider'],
               uid: omniauth_data['uid']).first
  end

  def self.create_provider_from_omniauth(omniauth_data)
    User.create(uid: omniauth_data['uid'],
                provider: omniauth_data['provider'],
                first_name: omniauth_data['info']['first_name'],
                last_name: omniauth_data['info']['last_name'],
                email: omniauth_data['info']['email'],
                person: Provider.new,
                gender: omniauth_data['extra']['raw_info']['gender'],
                google_raw_info: omniauth_data,
                password: SecureRandom.hex(16))
  end
  def self.create_customer_from_omniauth(omniauth_data)
    User.create(uid: omniauth_data['uid'],
                provider: omniauth_data['provider'],
                first_name: omniauth_data['info']['first_name'],
                last_name: omniauth_data['info']['last_name'],
                email: omniauth_data['info']['email'],
                person: Customer.new,
                gender: omniauth_data['extra']['raw_info']['gender'],
                google_raw_info: omniauth_data,
                password: SecureRandom.hex(16))
  end
end

def self.create_from_omniauth(omniauth_data)
  full_name = omniauth_data["info"]["name"].split
  User.create(uid:                      omniauth_data["uid"],
              provider:                 omniauth_data["provider"],
              first_name:               full_name[0],
              last_name:                full_name[1],
              twitter_consumer_token:   omniauth_data["credentials"]["token"],
              twitter_consumer_secret:  omniauth_data["credentials"]["secret"],
              twitter_raw_data:         omniauth_data,
              password:                 SecureRandom.hex(16)
              )
end
