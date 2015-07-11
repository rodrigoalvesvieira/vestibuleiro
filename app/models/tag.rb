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

  class << self

    ## Takes a string and returns all tags from the database
    ## whose title or body contain the term
    def search(search_term)
      term = /.*#{search_term}.*/i
      result = Tag.or({title: term})
    end
  end

private
  def format_tag_name
    self.tag_name = self.tag_name.downcase
    self.tag_name.gsub! " ", "-"
  end
end
