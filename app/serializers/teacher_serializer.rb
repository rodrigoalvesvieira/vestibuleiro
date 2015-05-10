class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :disciplines, :last_answered, :direct_questions
end
