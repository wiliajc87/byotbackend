require 'date'
require 'active_support/all'

class Participant < ActiveRecord::Base
  belongs_to :show
  belongs_to :play
  has_many :performances
  validates :name, :email, :presence => true
  validates_format_of :email, :with => /@/

  def roles_performed
    roles = []
    Performance.all.where(:participant_id => self.id).each do |participation|
      roles << participation.role
    end
    roles = roles.uniq
  end

  def show_count
    Performance.all.where(:participant_id => self.id).count
  end

  def member?
    if self.override
      true
    elsif self.show_count >= 6 && self.six_month_check
      true
    else
      false
    end
  end

  def six_month_check
    if self.show_count
      calc = (DateTime.now.year * 12 + DateTime.now.month) - ((self.performances.last.show.year).to_i * 12 + to_calendar_number(self.performances.last.show.month))
      if calc < 5
        true
      elsif calc == 5
        "5 Month Warning"
      else
        false
      end
    end
  end

  def to_calendar_number(string)
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    (months.index(string)+1)
  end
end