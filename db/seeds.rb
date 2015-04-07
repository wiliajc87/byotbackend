require 'csv'

Participant.create(:name => "Jordy Williams", :email => "jordy@example.com", :contact => true, :phone => "8067908575")
Participant.create(:name => "Rachel Morgan", :email => "rachel@example.com", :contact => true)
Participant.create(:name => "Cory O'Brien", :email => "cory@example.com", :contact => true)
Participant.create(:name => "Nathan Bosce", :email => "nathan@example.com", :contact => true)
Participant.create(:name => "Dan Foley", :email => "dan@example.com", :contact => true)
Participant.create(:name => "Vinny Grecco", :email => "vin@example.com", :contact => true)
Participant.create(:name => "Rachel Silvert", :email => "rachel.siv@example.com", :contact => true)
Participant.create(:name => "John Cook", :email => "john@example.com", :contact => true)
Participant.create(:name => "Josh Leeper", :email => "josh@example.com", :contact => true)


Show.create(:title => "Love is Bullshit", :month => "February", :year => "2015")


Play.create(:title => "Personal Heroes", :show_id => 1)
Play.create(:title => "Riki-Tiki-Tavi", :show_id => 1)
Play.create(:title => "Greek Bar", :show_id => 1)
Play.create(:title => "Some Random Shit", :show_id => 1)


Performance.create(:participant_id => 1, :show_id => 1, :play_id => 1, :role => "Writer")
Performance.create(:participant_id => 2, :show_id => 1, :play_id => 1, :role => "Actor")
Performance.create(:participant_id => 3, :show_id => 1, :play_id => 1, :role => "Actor")
Performance.create(:participant_id => 4, :show_id => 1, :play_id => 1, :role => "Director")

Performance.create(:participant_id => 5, :show_id => 1, :play_id => 2, :role => "Writer")
Performance.create(:participant_id => 6, :show_id => 1, :play_id => 2, :role => "Actor")
Performance.create(:participant_id => 7, :show_id => 1, :play_id => 2, :role => "Actor")
Performance.create(:participant_id => 8, :show_id => 1, :play_id => 2, :role => "Director")

CSV.foreach("byotcsv.csv") do |row|
  Participant.create(:name => row[0], :email => row[1])
end