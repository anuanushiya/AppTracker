class App

  include Mongoid::Document

  field :file_name, type: String
  field :date_created, type: Date
  field :location, type: String
  field :description, type: String
  field :reference, type: String

  validates :file_name, presence: {message: "must be filled"}  
  validates :file_name, uniqueness: {message: "already taken"}
  validates :location, presence: {message: "must be filled"}

  belongs_to :user

  embeds_one :deploy
  accepts_nested_attributes_for :deploy

end

