class Blueprint < ActiveRecord::Base

  belongs_to :floorplan

  validates :floorplan, :presence => true

end
