class Participant < ActiveRecord::Base
  belongs_to :show
  belongs_to :play
  has_many :performances
  validates :first_name, :last_name, :email, :presence => true
  validates_format_of :email, :with => /@/
  def show_count
    Participant.where(:email => self.email).count
  end
end