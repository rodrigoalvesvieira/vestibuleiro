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
  has_many :answers
  has_many :tags
  has_many :comments

  belongs_to :user

  has_one :analytics, class_name: "Analytics"

  accepts_nested_attributes_for :answers

  ## Callbacks
  after_create :setup_analytics

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

    def filterByTag(tag)
      result = Set.new Question.where(tags:tag)
    end
  end

private

  def setup_analytics
    self.build_analytics
    self.analytics.save!
  end
end
