class User
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Timestamps

  ## Constants
  ROLES = %w(student teacher)

  STATES = [
    { name: "Acre", acronym: "AC" },
    { name: "Alagoas", acronym: "AL" },
    { name: "Amapá", acronym: "AP" },
    { name: "Amazonas", acronym: "AM" },
    { name: "Bahia", acronym: "BA" },
    { name: "Ceará", acronym: "CE" },
    { name: "Distrito Federal", acronym: "DF" },
    { name: "Espírito Santo", acronym: "ES" },
    { name: "Goiás", acronym: "GO" },
    { name: "Maranhão", acronym: "MA" },
    { name: "Mato Grosso", acronym: "MT" },
    { name: "Mato Grosso do Sul", acronym: "MS" },
    { name: "Minas Gerais", acronym: "MG" },
    { name: "Pará", acronym: "PA) " },
    { name: "Paraíba", acronym: "PB" },
    { name: "Paraná", acronym: "PR" },
    { name: "Pernambuco", acronym: "PE" },
    { name: "Piauí", acronym: "PI" },
    { name: "Rio de Janeiro", acronym: "RJ" },
    { name: "Rio Grande do Norte", acronym: "RN" },
    { name: "Rio Grande do Sul", acronym: "RS" },
    { name: "Rondônia", acronym: "RO" },
    { name: "Roraima", acronym: "RR" },
    { name: "Santa Catarina", acronym: "SC" },
    { name: "São Paulo", acronym: "SP" },
    { name: "Sergipe", acronym: "SE" },
    { name: "Tocantins", acronym: "TO" }
  ]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ''
  field :encrypted_password, type: String, default: ''

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
  field :description,         type: String
  field :facebook,            type: String
  field :twitter,             type: String
  field :linkedin,            type: String

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
  has_many :questions
  has_many :answers

  ## Callbacks
  before_create :setup_nickname

  ## Validations
  validates :email, uniqueness: true
  # validates_inclusion_of :state

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
    self.nickname = self.email.partition('@').first
  end
end

public
  def ranking_user

    val = self.questions.count * 10
    val += self.answers.count * 15

    self.answers.each do |answer|
      if (answer.analytics.upvotes - answer.analytics.downvotes) >= 5
        val += answer.analytics.upvotes + (answer.analytics.upvotes * 20)
      end
    end

    self.questions.each do |question|
      if (question.analytics.upvotes - question.analytics.downvotes) >= 5
        val += question.analytics.upvotes + (question.analytics.upvotes * 10)
      end
    end

    val += self.sign_in_count

  end

def evaluate_teacher
  val = self.answers.count * 20
  self.answer.analytics.each do |analityc|
    val += (analityc.upvotes*5) - (analityc.downvotes*5)
    val += (analityc.favorites*10)
  end
  val
end
