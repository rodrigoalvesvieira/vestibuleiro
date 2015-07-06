class Answer
  ## Includes
  include Mongoid::Document
  include Mongoid::Timestamps

  ## Fields
  field :body, type: String
  field :user_id, type: Integer

  ## Relationships
  belongs_to :user
  belongs_to :question

  has_one :analytics, class_name: "Analytics"
  has_many :comments

  ## Callbacks
  after_create :deliver_notifications
  after_create :setup_analytics

  ## Validations
  validates :body, presence: true

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

private

  def deliver_notifications
    message = "#{self.user.name} respondeu a pergunta"
    path = "questions/#{self.id}"

    self.question.subscriptions.each do |subscription|
      subscription.user.notifications.create message: message, question: self.question
    end
  end

  def setup_analytics
    self.build_analytics
    self.analytics.save!
  end
end
