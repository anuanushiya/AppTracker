class User

  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password_digest, uniqueness: true
  validates :password, length: {minimum: 6}


  has_many :apps

  has_secure_password
end
