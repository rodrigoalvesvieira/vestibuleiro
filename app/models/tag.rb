class Tag
  ## Includes
  include Mongoid::Document
  include Mongoid::Timestamps

  ## Fields
  field :title, type: String
  field :tag_name, type: String
  field :description, type: String

  ## Relationships
  embedded_in :question
  ## Callbacks

  ## Validations

  ## Extras

  ## Methods

  def to_s
    self.tag_name
  end

  def search(search_term)
    term = /.*#{search_term}.*/i
    result = Set.new Tag.where(title: term, tag_name: term)
  end
end
