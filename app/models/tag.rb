class Tag
  ## Includes
  include Mongoid::Document
  include Mongoid::Timestamps

  ## Fields
  field :title, type: String
  field :tag_name, type: String
  field :description, type: String

  ## Relationships
  belongs_to :question
  belongs_to :discipline

  ## Callbacks
  before_create :format_tag_name

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
    self.tag_name = self.title.parameterize
  end
end
