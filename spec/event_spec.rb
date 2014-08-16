require 'spec_helper'

describe Event do 
	it { should validate_presence_of(:description) }
	it { should validate_presence_of(:location) }
	it 'capitalizes the description' do 
		new_event = Event.create(description: "surfing", location: "smugglers cove")
		expect(new_event.description).to eq "Surfing"
		expect(new_event.location).to eq "Smugglers cove"
	end
	it { should belong_to :user }
end