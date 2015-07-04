class Notification
  ## Includes
  include Mongoid::Document
  include Mongoid::Timestamps

  ## Constants
  STATUSES = %w(seen unseen)

  ## Scopes
  scope :seen, -> { where(status: STATUSES.first) }
  scope :unseen, -> { where(status: STATUSES.last) }
  scope :from_user, -> (user) { where(user_id: user.id) }

  ## Fields
  field :message, type: String
  field :type, type: String
  field :link, type: String
  field :status, type: String, default: STATUSES.last

  ## Relationships
  belongs_to :user
  belongs_to :question

  ## Callbacks

  ## Validations
  validates_inclusion_of :status, in: STATUSES

  ## Extras

  ## Methods
end
