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
	 	puts "0: exit"
	 	user_input = gets.chomp
	 	case user_input
	 		when '1' then create_event
	 		when '0' then exit
	 		else 
	 			puts "This is not a valid option"
		end
	end
end

def create_event
	print "Description: "; description = gets.chomp
	print "Location: "; location = gets.chomp
	print "Start date (yyyy-mm-dd): "; start_date = gets.chomp
	print "End date (yyyy-mm-dd): "; end_date = gets.chomp
	print "Start time (hh:mm): "; start_time = gets.chomp
	print "End time (hh:mm): "; end_time = gets.chomp
	new_event = Event.create(description: description, location: location, 
							 start_date: start_date, end_date: end_date, 	
							 start_time: start_time, end_time: end_time)
	puts "New event * #{new_event.description} * was added!\n\n"
end

menu