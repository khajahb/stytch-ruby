# frozen_string_literal: true

# !!!
# WARNING: This file is autogenerated
# Only modify code within MANUAL() sections
# or your changes may be overwritten later!
# !!!

require_relative 'request_helper'

module Stytch
  class CryptoWallets
    include Stytch::RequestHelper

    def initialize(connection)
      @connection = connection
    end

    # Initiate the authentication of a crypto wallet. After calling this endpoint, the user will need to sign a message containing only the returned `challenge` field.
    #
    # == Parameters:
    # crypto_wallet_type::
    #   The type of wallet to authenticate. Currently `ethereum` and `solana` are supported. Wallets for any EVM-compatible chains (such as Polygon or BSC) are also supported and are grouped under the `ethereum` type.
    #   The type of this field is +String+.
    # crypto_wallet_address::
    #   The crypto wallet address to authenticate.
    #   The type of this field is +String+.
    # user_id::
    #   The unique ID of a specific User.
    #   The type of this field is nilable +String+.
    # session_token::
    #   The `session_token` associated with a User's existing Session.
    #   The type of this field is nilable +String+.
    # session_jwt::
    #   The `session_jwt` associated with a User's existing Session.
    #   The type of this field is nilable +String+.
    #
    # == Returns:
    # An object with the following fields:
    # request_id::
    #   Globally unique UUID that is returned with every API call. This value is important to log for debugging purposes; we may ask for this value to help identify a specific API call when helping you debug an issue.
    #   The type of this field is +String+.
    # user_id::
    #   The unique ID of the affected User.
    #   The type of this field is +String+.
    # challenge::
    #   A challenge string to be signed by the wallet in order to prove ownership.
    #   The type of this field is +String+.
    # user_created::
    #   In `login_or_create` endpoints, this field indicates whether or not a User was just created.
    #   The type of this field is +Boolean+.
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    def authenticate_start(
      crypto_wallet_type:,
      crypto_wallet_address:,
      user_id: nil,
      session_token: nil,
      session_jwt: nil
    )
      headers = {}
      request = {
        crypto_wallet_type: crypto_wallet_type,
        crypto_wallet_address: crypto_wallet_address
      }
      request[:user_id] = user_id unless user_id.nil?
      request[:session_token] = session_token unless session_token.nil?
      request[:session_jwt] = session_jwt unless session_jwt.nil?

      post_request('/v1/crypto_wallets/authenticate/start', request, headers)
    end

    # Complete the authentication of a crypto wallet by passing the signature.
    #
    # == Parameters:
    # crypto_wallet_type::
    #   The type of wallet to authenticate. Currently `ethereum` and `solana` are supported. Wallets for any EVM-compatible chains (such as Polygon or BSC) are also supported and are grouped under the `ethereum` type.
    #   The type of this field is +String+.
    # crypto_wallet_address::
    #   The crypto wallet address to authenticate.
    #   The type of this field is +String+.
    # signature::
    #   The signature from the message challenge.
    #   The type of this field is +String+.
    # session_token::
    #   The `session_token` associated with a User's existing Session.
    #   The type of this field is nilable +String+.
    # session_duration_minutes::
    #   Set the session lifetime to be this many minutes from now. This will start a new session if one doesn't already exist,
    #   returning both an opaque `session_token` and `session_jwt` for this session. Remember that the `session_jwt` will have a fixed lifetime of
    #   five minutes regardless of the underlying session duration, and will need to be refreshed over time.
    #
    #   This value must be a minimum of 5 and a maximum of 527040 minutes (366 days).
    #
    #   If a `session_token` or `session_jwt` is provided then a successful authentication will continue to extend the session this many minutes.
    #
    #   If the `session_duration_minutes` parameter is not specified, a Stytch session will not be created.
    #   The type of this field is nilable +Integer+.
    # session_jwt::
    #   The `session_jwt` associated with a User's existing Session.
    #   The type of this field is nilable +String+.
    # session_custom_claims::
    #   Add a custom claims map to the Session being authenticated. Claims are only created if a Session is initialized by providing a value in `session_duration_minutes`. Claims will be included on the Session object and in the JWT. To update a key in an existing Session, supply a new value. To delete a key, supply a null value.
    #
    #   Custom claims made with reserved claims ("iss", "sub", "aud", "exp", "nbf", "iat", "jti") will be ignored. Total custom claims size cannot exceed four kilobytes.
    #   The type of this field is nilable +object+.
    #
    # == Returns:
    # An object with the following fields:
    # request_id::
    #   Globally unique UUID that is returned with every API call. This value is important to log for debugging purposes; we may ask for this value to help identify a specific API call when helping you debug an issue.
    #   The type of this field is +String+.
    # user_id::
    #   The unique ID of the affected User.
    #   The type of this field is +String+.
    # session_token::
    #   A secret token for a given Stytch Session.
    #   The type of this field is +String+.
    # session_jwt::
    #   The JSON Web Token (JWT) for a given Stytch Session.
    #   The type of this field is +String+.
    # user::
    #   The `user` object affected by this API call. See the [Get user endpoint](https://stytch.com/docs/api/get-user) for complete response field details.
    #   The type of this field is +User+ (+object+).
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    # session::
    #   If you initiate a Session, by including `session_duration_minutes` in your authenticate call, you'll receive a full Session object in the response.
    #
    #   See [GET sessions](https://stytch.com/docs/api/session-get) for complete response fields.
    #
    #   The type of this field is nilable +Session+ (+object+).
    def authenticate(
      crypto_wallet_type:,
      crypto_wallet_address:,
      signature:,
      session_token: nil,
      session_duration_minutes: nil,
      session_jwt: nil,
      session_custom_claims: nil
    )
      headers = {}
      request = {
        crypto_wallet_type: crypto_wallet_type,
        crypto_wallet_address: crypto_wallet_address,
        signature: signature
      }
      request[:session_token] = session_token unless session_token.nil?
      request[:session_duration_minutes] = session_duration_minutes unless session_duration_minutes.nil?
      request[:session_jwt] = session_jwt unless session_jwt.nil?
      request[:session_custom_claims] = session_custom_claims unless session_custom_claims.nil?

      post_request('/v1/crypto_wallets/authenticate', request, headers)
    end
  end
end
