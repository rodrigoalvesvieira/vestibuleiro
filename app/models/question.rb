class Question
  ## Includes
  include Mongoid::Document

  ## Fields
  field :title,       type: String
  field :body,        type: String
  field :tags,        type: Array
  field :user_id,     type: Integer

  ## Relationships
  belongs_to :user
  has_many :answers

  ## Callbacks

  ## Validations
end
