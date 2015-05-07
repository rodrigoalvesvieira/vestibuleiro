class Question
  ## Includes
  include Mongoid::Document

  ## Fields
  field :title,       type: String
  field :body,        type: String
  field :tags,        type: Array
  field :user_id,     type: Integer

  field :published,   type: Boolean, default: true

  ## Relationships
  belongs_to :user
  has_many :answers
  has_one :analytics

  ## Callbacks

  ## Validations

  ## Extras
  searchkick

  ## Methods
  def unpublish
    self.update_attributes :published, false
  end

  class << self

    ## Takes a string and returns all questions from the database
    ## whose title or body contain the term
    def search(search_term)
      term = /.*#{search_term}.*/i
      result = Set.new Question.find(term)
    end
  end
end
