class Region < ActiveRecord::Base
  belongs_to :image
  belongs_to :payoff
end
