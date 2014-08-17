class Event < ActiveRecord::Base
	belongs_to :user
	validates :description, :presence => true
	validates :location, :presence => true
	before_create :capitalize
	scope :surfing, -> {where(description: 'Surfing')}

private

	def capitalize
		self.description = self.description.capitalize
		self.location = self.location.capitalize
	end
end