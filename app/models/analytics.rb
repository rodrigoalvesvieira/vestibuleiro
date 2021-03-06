class Analytics
  ## Includes
  include Mongoid::Document
  include Mongoid::Timestamps

  ## Fields
  field :visualizations, type: Integer, default: 0
  field :favorites, type: Integer, default: 0
  field :upvotes, type: Integer, default: 0
  field :downvotes, type: Integer, default: 0
  field :users_id_vote, type: Array, default: []

  ## Relationships
  belongs_to :question
  belongs_to :answer
  ## Callbacks

  ## Validations

  ## Extras

  ## Methods
  def increment user, visualizations:, upvotes:, downvotes:
    self.visualizations += visualizations
    self.upvotes += upvotes
    self.downvotes += downvotes
    self.save

    if self.question
      unless self.question.is_subscribed? user
        self.question.subscriptions.create user_id: user.id
      end
    end

  end
end
