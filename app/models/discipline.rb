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
  class << self
    def perform_search(param)
      self.send(:search, param).records
    end
  end
  
  def as_indexed_json(options={})
    as_json(except: [:id, :_id])
  end
end
