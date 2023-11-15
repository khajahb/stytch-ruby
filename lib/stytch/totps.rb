# frozen_string_literal: true

# !!!
# WARNING: This file is autogenerated
# Only modify code within MANUAL() sections
# or your changes may be overwritten later!
# !!!

require_relative 'request_helper'

module Stytch
  class TOTPs
    include Stytch::RequestHelper

    def initialize(connection)
      @connection = connection
    end

    # Create a new TOTP instance for a user. The user can use the authenticator application of their choice to scan the QR code or enter the secret.
    #
    # == Parameters:
    # user_id::
    #   The `user_id` of an active user the TOTP registration should be tied to.
    #   The type of this field is +String+.
    # expiration_minutes::
    #   The expiration for the TOTP instance. If the newly created TOTP is not authenticated within this time frame the TOTP will be unusable. Defaults to 1440 (1 day) with a minimum of 5 and a maximum of 1440.
    #   The type of this field is nilable +Integer+.
    #
    # == Returns:
    # An object with the following fields:
    # request_id::
    #   Globally unique UUID that is returned with every API call. This value is important to log for debugging purposes; we may ask for this value to help identify a specific API call when helping you debug an issue.
    #   The type of this field is +String+.
    # totp_id::
    #   The unique ID for a TOTP instance.
    #   The type of this field is +String+.
    # secret::
    #   The TOTP secret key shared between the authenticator app and the server used to generate TOTP codes.
    #   The type of this field is +String+.
    # qr_code::
    #   The QR code image encoded in base64.
    #   The type of this field is +String+.
    # recovery_codes::
    #   The recovery codes used to authenticate the user without an authenticator app.
    #   The type of this field is list of +String+.
    # user::
    #   The `user` object affected by this API call. See the [Get user endpoint](https://stytch.com/docs/api/get-user) for complete response field details.
    #   The type of this field is +User+ (+object+).
    # user_id::
    #   The unique ID of the affected User.
    #   The type of this field is +String+.
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    def create(
      user_id:,
      expiration_minutes: nil
    )
      request = {
        user_id: user_id
      }
      request[:expiration_minutes] = expiration_minutes unless expiration_minutes.nil?

      post_request('/v1/totps', request)
    end

    # Authenticate a TOTP code entered by a user.
    #
    # == Parameters:
    # user_id::
    #   The `user_id` of an active user the TOTP registration should be tied to.
    #   The type of this field is +String+.
    # totp_code::
    #   The TOTP code to authenticate. The TOTP code should consist of 6 digits.
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
    # totp_id::
    #   The unique ID for a TOTP instance.
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
      user_id:,
      totp_code:,
      session_token: nil,
      session_duration_minutes: nil,
      session_jwt: nil,
      session_custom_claims: nil
    )
      request = {
        user_id: user_id,
        totp_code: totp_code
      }
      request[:session_token] = session_token unless session_token.nil?
      request[:session_duration_minutes] = session_duration_minutes unless session_duration_minutes.nil?
      request[:session_jwt] = session_jwt unless session_jwt.nil?
      request[:session_custom_claims] = session_custom_claims unless session_custom_claims.nil?

      post_request('/v1/totps/authenticate', request)
    end

    # Retrieve the recovery codes for a TOTP instance tied to a User.
    #
    # == Parameters:
    # user_id::
    #   The `user_id` of an active user the TOTP registration should be tied to.
    #   The type of this field is +String+.
    #
    # == Returns:
    # An object with the following fields:
    # request_id::
    #   Globally unique UUID that is returned with every API call. This value is important to log for debugging purposes; we may ask for this value to help identify a specific API call when helping you debug an issue.
    #   The type of this field is +String+.
    # user_id::
    #   The unique ID of the affected User.
    #   The type of this field is +String+.
    # totps::
    #   An array containing a list of all TOTP instances (along with their recovery codes) for a given User in the Stytch API.
    #   The type of this field is list of +TOTP+ (+object+).
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    def recovery_codes(
      user_id:
    )
      request = {
        user_id: user_id
      }

      post_request('/v1/totps/recovery_codes', request)
    end

    # Authenticate a recovery code for a TOTP instance.
    #
    # == Parameters:
    # user_id::
    #   The `user_id` of an active user the TOTP registration should be tied to.
    #   The type of this field is +String+.
    # recovery_code::
    #   The recovery code to authenticate.
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
    # totp_id::
    #   The unique ID for a TOTP instance.
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
    def recover(
      user_id:,
      recovery_code:,
      session_token: nil,
      session_duration_minutes: nil,
      session_jwt: nil,
      session_custom_claims: nil
    )
      request = {
        user_id: user_id,
        recovery_code: recovery_code
      }
      request[:session_token] = session_token unless session_token.nil?
      request[:session_duration_minutes] = session_duration_minutes unless session_duration_minutes.nil?
      request[:session_jwt] = session_jwt unless session_jwt.nil?
      request[:session_custom_claims] = session_custom_claims unless session_custom_claims.nil?

      post_request('/v1/totps/recover', request)
    end
  end
end
