# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Mutations::SignInUser', type: :request do
  describe '.resolve' do
    let!(:user) { create(:user) }

    context 'when the params are correct' do
      it 'returns a token' do
        args = { email: user.email, password: user.password }
        post '/graphql', params: { query: query(args) }

        json = JSON.parse(response.body)
        data = json['data']['signinUser']

        expect(data['token']).not_to be_nil
      end
    end

    def query(email:, password:)
      <<~GQL
        mutation {
          signinUser(input: {
            credentials: {
              email: "#{email}",
              password: "#{password}"
            }
          }) {
            token
            user {
              id
            }
          }
        }
      GQL
    end
  end
end
