# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Mutations::CreateUser', type: :request do
  describe '.resolve' do
    let(:name) { 'Test User' }
    let(:email) { 'test@example.com' }
    let(:password) { 'Passw0rd!' }

    before do
      args = { name: name, email: email, password: password }
      post '/graphql', params: { query: query(args) }
    end

    it 'creates a user' do
      expect(User.all.size).to eq 1
    end

    it 'returns a user' do
      json = JSON.parse(response.body)
      data = json['data']['createUser']

      expect(data).to include(
        'id' => User.last.id.to_s,
        'name' => name,
        'email' => email
      )
    end

    def query(name:, email:, password:)
      <<~GQL
        mutation {
          createUser (
            input: {
              name: "#{name}",
              authProvider: {
                credentials: {
                  email: "#{email}",
                  password: "#{password}"
                }
              }
            }
          ) {
            id
            name
            email
          }
        }
      GQL
    end
  end
end
