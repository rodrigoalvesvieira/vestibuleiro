class Analytics
  ## Includes
  include Mongoid::Document

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
  searchkick

  ## Methods

  def increment user, visualizations:, upvotes:, downvotes:
    self.visualizations += visualizations
    self.upvotes += upvotes
    self.downvotes += downvotes
    self.save
  end
end
