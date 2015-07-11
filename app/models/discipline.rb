class Discipline
  ## Includes
  include Mongoid::Document
  include Mongoid::Timestamps

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

    ## Takes a string and returns all disciplines from the database
    ## whose title or body contain the term
    def search(search_term)
      term = /.*#{search_term}.*/i
      result = Discipline.or({name: term}, {codename: term})
    end
  end
end
