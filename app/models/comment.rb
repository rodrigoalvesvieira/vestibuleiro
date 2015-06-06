class Comment
  ## Includes
  include Mongoid::Document
  include Mongoid::Timestamps

  ## Fields
  field :body, type: String
  field :user_id, type: Integer

  ## Relationships
  embedded_in :question
  embedded_in :answer

  def user
    return (User.find self.user_id)
  end
end
