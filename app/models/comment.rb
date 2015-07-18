class Comment
  ## Includes
  include Mongoid::Document
  include Mongoid::Timestamps
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  ## Fields
  field :body, type: String
  field :user_id, type: Integer

  ## Relationships
  belongs_to :question
  belongs_to :answer

  def user
    return (User.find self.user_id)
  end
end
