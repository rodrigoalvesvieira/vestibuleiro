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
  def calculate_favorites
    @result = self.analytics.upvotes - self.analytics.downvotes
    return @result
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

  class << self
    ## Takes a string and returns all answers from the database
    ## whose title or body contain the term
    def search(search_term)
      term = /.*#{search_term}.*/i
      result = Answer.or({body: term})
    end
  end

private

  def deliver_notifications
    message = "#{self.user.name} respondeu a pergunta"
    path = "questions/#{self.id}"

    self.question.subscriptions.each do |subscription|
      if subscription.user.id != self.user.id
        subscription.user.notifications.create(message: message, user_who_id: self.user.id, question: self.question)
      end
    end
  end

  def setup_analytics
    self.build_analytics
    self.analytics.save!
  end
end
