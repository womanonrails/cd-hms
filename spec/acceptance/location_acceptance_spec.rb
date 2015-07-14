require 'acceptance_helper'

resource 'Api::Location' do
  header 'Accept', 'application/vnd.api+json'
  header 'Content-Type', 'application/vnd.api+json'
  header 'Authorization', encoded_service_token

  response_field :id, 'Id of location', 'Type' => 'Uuid'
  response_field :name, 'Name of location', 'Type' => 'String'
  response_field :address, 'Location address', 'Type' => 'Text'
  response_field :url, 'Location url', 'Type' => 'String'

  get 'api/locations' do
    example 'Listing all locations' do
      location = create(:location)
      do_request
      locations = JSON.parse(response_body)['locations']
      expect(status).to eq 200
      expect(locations.first).to eq(
        'id' => location.id,
        'name' => location.name,
        'address' => location.address,
        'url' => location.url
      )
    end
  end

  get 'api/locations/:id' do
    parameter :id, 'Id of location', required: true

    let(:id) { location.id }
    let(:location) { create(:location) }

    example 'Show specific location' do
      do_request
      data = JSON.parse(response_body)['location']
      expect(status).to eq 200
      expect(data.slice('name')).to eq('name' => location.name)
      expect(data.slice('address')).to eq('address' => location.address)
      expect(data.slice('url')).to eq('url' => location.url)
    end
  end

  post 'api/locations' do
    parameter :name, 'Name of location', required: true
    parameter :address, 'Address of location'
    parameter :url, 'Url of location'

    let(:name) { 'Paris' }
    let(:address) { 'France' }
    let(:url) { 'http://www.toureiffel.paris/' }

    let(:raw_post) { { location: params }.to_json }

    example_request 'Creating a location' do
      location = JSON.parse(response_body)['location']
      expect(location.except('id', 'created_at', 'updated_at')).to eq(
        'name' => name,
        'address' => address,
        'url' => url
      )
      expect(status).to eq 201
    end
  end

  put 'api/locations/:id' do
    let(:location) { create(:location) }
    let(:id) { location.id }

    parameter :name, 'Name of location', required: true
    parameter :address, 'Address of location'
    parameter :url, 'Url of location'

    let(:name) { 'Paris' }

    let(:raw_post) { { location: params }.to_json }

    example_request 'Updating a location' do
      expect(status).to eq 204
    end
  end

  delete 'api/locations/:id' do
    let(:location) { create(:location) }
    let(:id) { location.id }

    example_request 'Updating a location' do
      expect(status).to eq 204
    end
  end
end
