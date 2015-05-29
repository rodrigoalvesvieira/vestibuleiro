class Teacher < User
  ##includes
  include Mongoid::Document

  ##fields
  field :disciplines,      type: Array
  field :last_answered,    type: Array
  field :direct_questions, type: Array
  field :websites,         type: Array
  field :workplace,        type: Array
  field :email,            type: String, default: ""
  field :phone_number,     type: String, default: ""

  ## Methods

  class << self

    ## Takes a string and returns all answers from the database
    ## whose title or body contain the term

    def search(search_term)
      term = /.*#{search_term}.*/i
      result = Set.new Answer.find(term)
    end
  end



end
