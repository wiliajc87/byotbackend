module ShowHelper
  def show_title_array
    array = []
    Show.all.each do |show|
      array << show.title
    end
    array
  end
end
