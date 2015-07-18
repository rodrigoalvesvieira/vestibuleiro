class Answer
  ## Includes
  include Mongoid::Document
  include Mongoid::Timestamps
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

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

  ## Methods
  class << self
    def perform_search(param)
      self.send(:search, param).records
    end
  end
  
  def as_indexed_json(options={})
    as_json(except: [:id, :_id])
  end

  def calculate_favorites
    @result = self.analytics.upvotes - self.analytics.downvotes
    return @result
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
