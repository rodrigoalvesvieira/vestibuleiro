class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :name, :state, :city, :imagePerfil, :disciplines, :last_aswered, :direct_questions
end
