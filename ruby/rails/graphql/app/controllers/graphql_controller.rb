# frozen_string_literal: true

class GraphqlController < ApplicationController
  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  # protect_from_forgery with: :null_session

  def execute
    result = GraphqlSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?

    handle_error_in_development e
  end

  private

  def query
    params[:query]
  end

  def variables
    prepare_variables(params[:variables])
  end

  def context
    {
      current_user: current_user,
      session: session
    }
  end

  def operation_name
    params[:operationName]
  end

  def current_user
    return unless session[:token]

    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
    token = crypt.decrypt_and_verify session[:token]
    user_id = token.gsub('user-id:', '').to_i
    User.find user_id
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    nil
  end

  # Handle variables in form data, JSON body, or a blank value
  def prepare_variables(variables_param) # rubocop:disable Metrics/MethodLength
    case variables_param
    when String
      if variables_param.present?
        JSON.parse(variables_param) || {}
      else
        {}
      end
    when Hash
      variables_param
    when ActionController::Parameters
      variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{variables_param}"
    end
  end

  def handle_error_in_development(exception)
    logger.error exception.message
    logger.error exception.backtrace.join("\n")

    render json: { errors: [{ message: exception.message, backtrace: exception.backtrace }], data: {} },
           status: :internal_server_error
  end
end
