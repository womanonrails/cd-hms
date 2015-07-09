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
  response_field :serial_numver, 'Hardware serial number', 'Type' => 'String'
  response_field :price, 'Price of hardware', 'Type' => 'Float'
  response_field :status, 'Status of hardware', 'Type' => 'String'
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

  # get '/hits/:id' do
  #   parameter :id, 'Id of hits', required: true

  #   let(:id) { hits.id }
  #   let(:member) { hits.members.first }
  #   let(:hits) do
  #     create(
  #       :hits, title: 'Ruby on Rails', owner_id: owner_id, user_id: owner_id,
  #              idea_ids: idea_ids
  #     )
  #   end
  #   let(:idea_ids) do
  #     [
  #       'f52e5de4-beaf-455c-94fc-2d794a610c5c',
  #       'a5f5b098-a963-4e59-9b02-50427e07a43d'
  #     ]
  #   end

  #   example 'Show specific hits for member' do
  #     do_request
  #     data = JSON.parse(response_body)['hits']
  #     hits_ideas = JSON.parse(response_body)['ideas']
  #     hits_member = JSON.parse(response_body)['members']
  #     expect(status).to eq 200
  #     expect(data.slice('title')).to eq('title' => 'Ruby on Rails')
  #     expect(data.slice('ideas_number')).to eq('ideas_number' => idea_ids.size)
  #     expect(hits_ideas.first['id']).to eq idea_ids.first
  #     expect(hits_ideas.last['id']).to eq idea_ids.last
  #     expect(hits_ideas.first['hits_id']).to eq id
  #     expect(hits_ideas.last['hits_id']).to eq id
  #     expect(hits_member.last['id']).to eq member.id
  #     expect(data).to have_key('created_at')
  #   end
  # end

  # get '/hits/:id' do
  #   parameter :id, 'Id of hits', required: true

  #   let(:id) { hits.id }
  #   let(:hits) { create(:hits, title: 'Ruby on Rails') }

  #   example 'Show hits for other user (not member)' do
  #     do_request
  #     data = JSON.parse(response_body)['hits']
  #     hits_ideas = JSON.parse(response_body)['ideas']
  #     expect(status).to eq 200
  #     expect(data.slice('title', 'permissions')).to eq(
  #       'title' => 'Ruby on Rails',
  #       'permissions' => { 'editable' => false }
  #     )
  #     expect(data).to have_key('created_at')
  #     expect(hits_ideas).to be_empty
  #   end
  # end

  # post '/hits' do
  #   parameter :title, 'Title of hits', required: true
  #   parameter :description, 'Description of hits'
  #   parameter :votes, 'Nubmer of votes for hits', required: true
  #   parameter :idea_ids, 'Id of hits ideas', required: true

  #   let(:description) { 'This is Ruby on Rails' }
  #   let(:idea_ids) do
  #     [
  #       'f52e5de4-beaf-455c-94fc-2d794a610c5c',
  #       'a5f5b098-a963-4e59-9b02-50427e07a43d'
  #     ]
  #   end
  #   let(:member) { Hits.last.members.first }
  #   let(:title) { 'Ruby on Rails' }
  #   let(:votes) { rand(1..9) }

  #   let(:raw_post) { { hits: params }.to_json }

  #   example_request 'Creating a hits' do
  #     hits = JSON.parse(response_body)['hits']
  #     hits_ideas = JSON.parse(response_body)['ideas']
  #     expect(hits.except('id', 'created_at', 'updated_at')).to eq(
  #       'title' => title,
  #       'description' => description,
  #       'votes' => votes,
  #       'ideas_number' => idea_ids.size,
  #       'idea_ids' => idea_ids,
  #       'member_id' => member.id,
  #       'permissions' => { 'editable' => true }
  #     )
  #     expect(hits).to have_key('created_at')
  #     expect(hits_ideas.first['id']).to eq idea_ids.first
  #     expect(hits_ideas.last['id']).to eq idea_ids.last
  #     expect(status).to eq 201
  #   end
  # end

  # put 'hits/:id' do
  #   let(:hits) { create(:hits, title: 'Ruby on Rails', owner_id: owner_id) }
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
