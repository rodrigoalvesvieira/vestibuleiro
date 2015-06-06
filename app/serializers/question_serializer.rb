class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :body, :tags, :user_id
end
