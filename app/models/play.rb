class Play < ActiveRecord::Base
  has_many :performances
  has_many :participants, through: :performances
  belongs_to :show
  validates :title, :presence => true
  validates :show_id, :presence => true
end
