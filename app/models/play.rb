class Play < ActiveRecord::Base
  has_many :performances
  has_many :participants, through: :performances
  belongs_to :show
  def writer_array
    @result = []
    Play.find(1).performances.where(:role => "Writer").each do |writer|
      @result << writer
    end
  end
end
