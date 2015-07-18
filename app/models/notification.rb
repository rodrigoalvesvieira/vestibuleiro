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
  field :user_who_id, type: String

  ## Relationships
  belongs_to :user
  belongs_to :question

  ## Callbacks
  after_create :deliver_mail

  ## Validations
  validates_inclusion_of :status, in: STATUSES

  ## Extras

  ## Methods
  def mark_as_seen
    self.update_attribute :status, STATUSES.first
  end

  def get_avatar_user
    user_who = User.find(self.user_who_id)

    avatar_url = user_who.avatar

    return avatar_url.url

  end

  def set_who_user_id user_id
    self.user_who_id = user_id
  end

private
  def deliver_mail
    NotificationMailer.notify_answer(self).deliver_now
  end
end
