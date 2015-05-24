class Discipline
  ## Includes
  include Mongoid::Document
  include Mongoid::Timestamps

  ## Fields
  field :name, type: String
  field :codename, type: String

  ## Relationships
  embeds_many :tags
  ## Callbacks

  ## Validations
  validates :name, presence: true
  validates :codename, presence: true
  validates :name, uniqueness: true
  validates :codename, uniqueness: true
  ## Extras

  ## Methods
end
