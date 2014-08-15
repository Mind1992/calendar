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

menu