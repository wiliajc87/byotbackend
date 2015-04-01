class Participant < ActiveRecord::Base
  belongs_to :show
  belongs_to :play
  has_many :performances
  validates :first_name, :last_name, :email, :presence => true
  validates_format_of :email, :with => /@/
  def show_count
    Performance.all.where(:participant_id => self.id).count
  end
  def roles_performed
    roles = []
    Performance.all.where(:participant_id => self.id).each do |participation|
      roles << participation.role
    end
    roles = roles.uniq
  end
end