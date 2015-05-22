class Student < User
  #Includes
  include Mongoid::Document

  #Fields
  field :desired_course,     type: String
  field :schools,    type: Array

  #Methods
  class << self
    ## Takes a string and returns all questions from the database
    ## whose title or body contain the term
    def search(search_term)
      term = /.*#{search_term}.*/i
      result = Set.new Question.find(term)
    end


  end
end
