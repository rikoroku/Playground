# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Mutations::CreateLink', type: :request do
  describe '.resolve' do
    let(:url) { 'http://example.com' }
    let(:description) { 'test' }

    before do
      post '/graphql', params: { query: query(url: url, description: description) }
    end

    it 'creates a link' do
      expect(Link.all.size).to eq 1
    end

    it 'returns a link' do
      json = JSON.parse(response.body)
      data = json['data']['createLink']

      expect(data).to include(
        'id' => Link.last.id.to_s,
        'url' => url,
        'description' => description
      )
    end

    def query(url:, description:)
      <<~GQL
        mutation {
          createLink(
            input: {
              url: "#{url}",
              description: "#{description}"
            }
          ) {
            id
            url
            description
          }
        }
      GQL
    end
  end
end
