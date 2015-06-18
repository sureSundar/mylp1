class Project < ActiveRecord::Base
  belongs_to :user
  has_many :images
  has_many :payoffs
end
