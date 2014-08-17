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
	it 'should return all surfing spots' do 
		new_event = Event.create(description: "surfing", location: "smugglers cove")
		new_event2 = Event.create(description: "surfing", location: "indian beach")
		new_event3 = Event.create(description: "shopping", location: "New Seasons")
		expect(Event.surfing).to eq [new_event, new_event2]
	end
end