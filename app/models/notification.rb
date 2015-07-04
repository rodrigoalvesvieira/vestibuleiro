class Notification
  ## Includes
  include Mongoid::Document
  include Mongoid::Timestamps

  ## Constants

  ## Fields
  field :message, type: String
  field :type, type: String
  field :link, type: String

  ## Relationships
  # belongs_to :user

  ## Callbacks

  ## Validations

  ## Extras

  ## Methods
end
