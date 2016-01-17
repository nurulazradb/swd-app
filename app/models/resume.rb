require 'digest/md5'

class Resume < ActiveRecord::Base
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, uniqueness: true
  validates :cv, presence: true

  def fullname
    [firstname, lastname].join(' ')
  end

  def gravatar_hash
    Digest::MD5.hexdigest(email.downcase)
  end
end
