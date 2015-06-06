class User
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Timestamps

  ## Constants
  ROLES = %w(student teacher)

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  field :name,               type: String
  field :nickname,           type: String
  field :role,               type: String, default: ROLES.first
  field :city,               type: String
  field :state,              type: String
  field :description         type: String
  field :facebook            type: String
  field :twitter             type: String
  field :linkedin            type: String

  # Student fields
  field :school_year,        type: String
  field :current_school,     type: String
  field :desired_course,     type: String

  # Teacher fields
  field :disciplines,      type: Array
  field :last_answered,    type: Array
  field :websites,         type: Array
  field :workplace,        type: Array
  field :phone_number,     type: String, default: ""

  has_mongoid_attached_file :avatar

  ## Relationships
  embeds_many :questions
  embeds_many :answers

  ## Callbacks
  after_create :setup_nickname

  ## Validations
  validates :nickname, uniqueness: true
  validates_attachment_content_type :avatar, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time
private
  def setup_nickname
  end
end
