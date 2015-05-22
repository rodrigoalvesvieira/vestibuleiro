class Question
  ## Includes
  include Mongoid::Document
  include Mongoid::Timestamps

  ## Fields
  field :title,       type: String
  field :body,        type: String

  field :published,   type: Boolean, default: true

  ## Relationships
  embedded_in :user
  embeds_many :answers
  embeds_many :tags
  embeds_one :analytics

  ## Callbacks

  ## Validations

  ## Extras
  searchkick

  ## Methods
  def unpublish
    self.update_attributes :published, false
  end

  # TODO: fix implementation
  def mostly_upvoted_answer
    self.answers.first
  end

  class << self

    ## Takes a string and returns all questions from the database
    ## whose title or body contain the term
    def search(search_term)
      term = /.*#{search_term}.*/i
      result = Set.new Question.find(term)
    end

    def filterByTag(tag)
      result = Set.new Question.where(tags:tag)
    end
  end
end
