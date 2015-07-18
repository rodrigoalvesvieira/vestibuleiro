class Analytics
  ## Includes
  include Mongoid::Document
  include Mongoid::Timestamps
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

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
  class << self
    def perform_search(param)
      self.send(:search, param).records
    end
  end
  
  def as_indexed_json(options={})
    as_json(except: [:id, :_id])
  end

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
