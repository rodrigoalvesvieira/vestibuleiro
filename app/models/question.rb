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

  has_many :subscriptions
  has_many :notifications
  
  belongs_to :user

  has_one :analytics, class_name: "Analytics"

  accepts_nested_attributes_for :answers
  accepts_nested_attributes_for :tags

  ## Callbacks
  after_create :setup_analytics
  after_create :subscribe_author

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

  def add_voter(user)
    self.analytics.users_id_vote += [user.id]
    self.analytics.save
  end

  def is_voter(user)
    self.analytics.users_id_vote.each do |user_id_vote|
      return true if user_id_vote == user.id
    end

    return false
  end

  def is_subscribed?(user)
    self.subscriptions.each do |subscription|
      return true if subscription.user == user
    end

    return false
  end

  class << self

    ## Takes a string and returns all questions from the database
    ## whose title or body contain the term
    def search(search_term)
      term = /.*#{search_term}.*/i
      result = Set.new Question.find(term)
    end

    def filter_by_tag(tag)
      result = Set.new Question.where(tags:tag)
    end
  end

private

  def setup_analytics
    self.build_analytics
    self.analytics.save!
  end

  # The author of the question is its first watcher
  def subscribe_author
    self.subscriptions.create user_id: self.user.id
  end
end
