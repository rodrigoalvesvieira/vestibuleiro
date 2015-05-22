class StudentSerializer < ActiveModel::Serializer
  attributes :id, :desired_course, :schools
end
