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
  def increment_metadata(values = { visualizations: 0, favorites: 0, upvotes: 0, downvotes: 0 })
    self.visualizations = values[:visualizations]
    self.favorites = values[:favorites]
    self.upvotes = values[:upvotes]
    self.downvotes = values[:downvotes]
    self.save
  end
end
