require 'acceptance_helper'

resource 'Api::Hardware' do
  header 'Accept', 'application/vnd.api+json'
  header 'Content-Type', 'application/vnd.api+json'

  response_field :id, 'Id of hardware', 'Type' => 'Uuid'
  response_field :name, 'Name of hardware', 'Type' => 'String'
  response_field :length, 'Length of hardware', 'Type' => 'Float'
  response_field :width, 'Width of hardware', 'Type' => 'Float'
  response_field :height, 'Height of hardware', 'Type' => 'Float'
  response_field :weight, 'Weight of hardware', 'Type' => 'Float'
  response_field :serial_number, 'Hardware serial number', 'Type' => 'String'
  response_field :price, 'Price of hardware', 'Type' => 'Float'
  response_field :state, 'Status of hardware', 'Type' => 'String'
  response_field :note, 'Notes about hardware', 'Type' => 'Text'
  response_field :warranty_expired_on, 'Hardware warranty expired date', 'Type' => 'Date'

  get 'api/hardwares' do
    let(:parameters) { ['id', 'name', 'length', 'warranty_expired_on'] }

    example 'Listing all hardwares' do
      hardware = create(:hardware,
                        name: 'Computer',
                        length: 120,
                        warranty_expired_on: Time.now
                       )
      do_request
      hardwares = JSON.parse(response_body)['hardwares']
      expect(status).to eq 200
      expect(hardwares.first.slice(*parameters)).to eq(
        'id' => hardware.id,
        'name' => hardware.name,
        'length' => hardware.length,
        'warranty_expired_on' => hardware.warranty_expired_on.to_s
      )
    end
  end

  get 'api/hardwares/:id' do
    parameter :id, 'Id of hardware', required: true

    let(:id) { hardware.id }
    let(:hardware) do
      create(:hardware,
             name: 'Computer', length: 120, warranty_expired_on: Time.now
            )
    end

    example 'Show specific hardware' do
      do_request
      data = JSON.parse(response_body)['hardware']
      expect(status).to eq 200
      expect(data.slice('name')).to eq('name' => hardware.name)
      expect(data.slice('length')).to eq('length' => hardware.length)
    end
  end

  post 'api/hardwares' do
    parameter :name, 'Name of hardware', required: true
    parameter :length, 'Length of hardware'
    parameter :width, 'Width of hardware'
    parameter :height, 'Height of hardware'
    parameter :weight, 'Weight of hardware'
    parameter :serial_number, 'Hardware serial number'
    parameter :price, 'Price of hardware'
    parameter :state, 'Status of hardware'
    parameter :note, 'Notes about hardware'
    parameter :warranty_expired_on, 'Hardware warranty expired date'

    let(:name) { 'Computer' }
    let(:length) { 120.0 }
    let(:state) { 'available' }
    let(:warranty_expired_on) { Time.now.to_s }

    let(:raw_post) do
      { hardware: params }.to_json
    end

    example_request 'Creating a hardware' do
      hardware = JSON.parse(response_body)['hardware']
      expect(hardware.except('id', 'created_at', 'updated_at')).to eq(
        'name' => name,
        'length' => length,
        'state' => state,
        'width' => nil,
        'height' => nil,
        'weight' => nil,
        'serial_number' => nil,
        'price' => nil,
        'note' => nil,
        'warranty_expired_on' => Date.parse(warranty_expired_on).to_s
      )
      expect(status).to eq 201
    end
  end

  # put 'hardware/:id' do
  #   let(:hardware) do
  #     create(:hardware,
  #            name: 'Computer', length: 120, warranty_expired_on: Time.now
  #           )
  #   end
  #   let(:id) { hits.id }

  #   parameter :title, 'Title of hits'
  #   parameter :description, 'Description of hits'
  #   parameter :votes, 'Nubmer of votes for hits'
  #   parameter :idea_ids, 'Id of hits ideas'

  #   let(:title) { 'New Ruby on Rails' }
  #   let(:description) { 'Ruby on Rails Rules' }
  #   let(:idea_ids) { %w( 7 8 9 11 15 ) }
  #   let(:votes) { rand(1..9) }

  #   let(:raw_post) { { hits: params }.to_json }

  #   example_request 'Updating an hits' do
  #     expect(status).to eq 204
  #   end
  # end
end
