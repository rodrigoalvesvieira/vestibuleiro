class Subscription
  ## Includes
  include Mongoid::Document
  include Mongoid::Timestamps

  ## Relationships
  belongs_to :user
  belongs_to :question

  ## Methods
end
