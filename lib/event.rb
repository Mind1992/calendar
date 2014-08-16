class Event < ActiveRecord::Base
	validates :description, :presence => true
	validates :location, :presence => true
	before_create :capitalize

private

	def capitalize
		self.description = self.description.capitalize
		self.location = self.location.capitalize
	end
end