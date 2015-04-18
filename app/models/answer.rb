class Answer
  ## Includes
  include Mongoid::Document

  ## Fields
  field :user_id, type: Integer
  field :question_id, type: Integer
  field :body, type: String

  ## Relationships
  belongs_to :question

  ## Callbacks

  ## Validations

  ## Extras
  searchkick

  ## Methods

  class << self

    ## Takes a string and returns all answers from the database
    ## whose title or body contain the term

    def search(search_term)
      term = /.*#{search_term}.*/i
      result = Set.new Answer.find(term)
    end
  end
end
