class Subscription
  ## Includes
  include Mongoid::Document
  include Mongoid::Timestamps
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  ## Relationships
  belongs_to :user
  belongs_to :question
end
