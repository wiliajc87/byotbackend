class Show < ActiveRecord::Base
  has_many :plays
  has_many :performances
  has_many :participants, through: :performances
  validates :title, :presence => true
end