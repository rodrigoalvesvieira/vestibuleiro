class Tag
  ## Includes
  include Mongoid::Document
  include Mongoid::Timestamps

  ## Fields
  field :title, type: String
  field :tag_name, type: String
  field :description, type: String

  ## Relationships
  # embedded_in :question
  ## Callbacks

  ## Validations

  ## Extras

  ## Methods

  def to_s
    self.tag_name
  end
end
