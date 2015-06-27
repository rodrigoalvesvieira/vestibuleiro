class Question
  ## Includes
  include Mongoid::Document
  include Mongoid::Timestamps

  ## Constants
  STATUSES = ["open", "answered"]

  ## Fields
  field :discipline,   type: String, default: "Geral"  
  
  field :title,       type: String
  field :body,        type: String
  field :published,   type: Boolean, default: true
  field :status,      type: String, default: STATUSES.first

  ## Relationships
  belongs_to :user
  embeds_many :answers
  embeds_many :tags
  embeds_many :comments

  embeds_one :analytics, class_name: "Analytics"

  accepts_nested_attributes_for :answers

  ## Callbacks
  before_create :setup_analytics

  ## Validations
  validates_inclusion_of :status, in: STATUSES

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
  end

private

  def setup_analytics
    self.build_analytics
  end
end
