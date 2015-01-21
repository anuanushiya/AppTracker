class User

  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

  validates :name, presence: {message: "field must be filled in"}
  validates :email, presence: {message: "field must be filled in"}
  validates :email, uniqueness: {message: "belongs to another user"}
  validates :password_digest, uniqueness: {message: "belongs to another user"}
  validates :password, length: {minimum: 6}


  has_many :apps

  has_secure_password
end
