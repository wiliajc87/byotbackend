class Performance < ActiveRecord::Base
  belongs_to :show
  belongs_to :play
  belongs_to :participant
  validates :role, :presence => true
end