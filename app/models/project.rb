class Project < ActiveRecord::Base

  MAX_NAME_LENGTH = 100

  has_many :floorplans

  validates :name, :length => {:maximum => MAX_NAME_LENGTH}, :presence => true

end
