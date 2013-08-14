class Floorplan < ActiveRecord::Base

  MAX_DISPLAY_NAME_LENGTH = 100

  belongs_to :project
  has_many :blueprints

  validates :display_name, :length => {:maximum => MAX_DISPLAY_NAME_LENGTH}, :presence => true
  validates :project, :presence => true

end
