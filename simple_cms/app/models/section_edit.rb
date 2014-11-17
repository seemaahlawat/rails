class SectionEdit < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :admin_user
  belongs_to :section
end
