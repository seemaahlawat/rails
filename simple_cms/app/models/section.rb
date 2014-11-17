class Section < ActiveRecord::Base

	attr_accessible :name, :position, :visible

	belongs_to :page
  has_many :section_edits
  has_many :admin_user, :through => :section_edits

  acts_as_list

  CONTENT_TYPES = ['text', 'HTML']

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  # validates_inclusion_of :content_type, :in => ['text','HTML'], :message => "must be one of : #{CONTENT_TYPES.join(', ')}"
  # validates_presence_of :content

	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:invisible => false) }
  scope :sorted, lambda { order("sections.position ASC") }
	scope :newest_first, lambda { order("psections.created_at DESC") }
  
end
