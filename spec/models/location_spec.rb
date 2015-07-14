require 'rails_helper'

RSpec.describe Location, type: :model do
  it 'after destroy leave connected hardware' do
    location = create(:location)
    create(:hardware, location: location)
    expect{ location.destroy }.to_not change{ Location.count }
  end
end
