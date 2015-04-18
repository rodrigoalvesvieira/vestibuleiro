class Answer
  ## Includes
  include Mongoid::Document

  ## Fields
  field :user_id, type: Integer
  field :question_id, type: Integer
  field :body, type: String

  ## Relationships
  belongs_to :question

  ## Callbacks

  ## Validations
end
