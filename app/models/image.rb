class Image < ActiveRecord::Base
  belongs_to :project
  has_many :regions
end
