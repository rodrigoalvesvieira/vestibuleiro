class Discipline
  ## Includes
  include Mongoid::Document
  include Mongoid::Timestamps
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  ## Fields
  field :name, type: String
  field :codename, type: String

  ## Relationships
  has_many :tags
  ## Callbacks

  ## Validations
  validates :name, presence: true
  validates :codename, presence: true
  validates :name, uniqueness: true
  validates :codename, uniqueness: true
  ## Extras

  ## Methods
end
