class Page < ActiveRecord::Base

	attr_accessible :name, :permalink, :position, :position, :visible, :created_at, :updated_at, :subject_id
	belongs_to :subject
	has_and_belongs_to_many :admin_users

	acts_as_list

	validates_presence_of :name
	validates_length_of :name, :maximum => 255
	validates_presence_of :permalink
	validates_length_of :permalink, :within => 3..255
	validates_uniqueness_of :permalink
	validates_presence_of :subject_id

	scope :sorted, lambda { order("pages.position ASC") }
	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:invisible => false) }
	scope :newest_first, lambda { order("pages.created_at DESC") }
		
end
