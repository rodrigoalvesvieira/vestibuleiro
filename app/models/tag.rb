class Tag
  ## Includes
  include Mongoid::Document
  include Mongoid::Timestamps

  ## Fields
  field :title, type: String
  field :tag_name, type: String
  field :description, type: String

  ## Relationships
  embedded_in :discipline
  ## Callbacks
  before_save :format_tag_name

  ## Validations
  validates :title, presence: true
  validates :tag_name, presence: true
  validates :tag_name, uniqueness: true

  ## Extras

  ## Methods

  def to_s
    self.tag_name
  end

private
  def format_tag_name
    self.tag_name = self.tag_name.downcase
    self.tag_name.gsub! " ", "-"
  end
end
