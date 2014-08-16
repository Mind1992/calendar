require 'pry'
require 'bundler/setup'
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def menu 
	puts "***Calendar App***"
	
	loop do 
		puts "1: create event"
	 	puts "2: edit event"
	 	puts "3: delete event"
	 	puts "4: list events"
	 	puts "0: exit"
	 	user_input = gets.chomp
	 	case user_input
	 		when '1' then create_event
	 		when '2' then edit_event
	 		when '3' then delete_event
	 		when '4' then list_events
	 		when '0' then exit
	 		else 
	 			puts "This is not a valid option"
		end
	end
end

def create_event
	print "Description: "; description = gets.chomp
	print "Location: "; location = gets.chomp
	print "Start date and time (yyyy-mm-dd hh:mm): "; start_datetime = gets.chomp
	print "End date and time (yyyy-mm-dd hh:mm): "; end_datetime = gets.chomp
	new_event = Event.create(description: description, location: location, 
							 start_datetime: start_datetime, end_datetime: end_datetime)
	puts "New event * #{new_event.description} * was added!\n\n"
end

def list_events
	puts "Here are all the events: "
	Event.all.each do |event|
		puts "#{event.id}. #{event.description}"
	end
	puts "\n"
end

def edit_event
	list_events
	print "Select the number of the event to edit: "
	selected_event = Event.find(gets.chomp)
	print "Location: "; location = gets.chomp
	print "Start date and time (yyyy-mm-dd hh:mm): "; start_datetime = gets.chomp
	print "End date and time (yyyy-mm-dd hh:mm): "; end_datetime = gets.chomp
	selected_event.update(location: location, 
							 start_datetime: start_datetime, end_datetime: end_datetime)
	puts "* #{selected_event.description} * was updated"
end

menu