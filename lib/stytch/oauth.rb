# frozen_string_literal: true

# !!!
# WARNING: This file is autogenerated
# Only modify code within MANUAL() sections
# or your changes may be overwritten later!
# !!!

require_relative 'request_helper'

module Stytch
  class OAuth
    include Stytch::RequestHelper

    def initialize(connection)
      @connection = connection
    end

    # Generate an OAuth Attach Token to pre-associate an OAuth flow with an existing Stytch User. Pass the returned `oauth_attach_token` to the same provider's OAuth Start endpoint to treat this OAuth flow as a login for that user instead of a signup for a new user.
    #
    # Exactly one of `user_id`, `session_token`, or `session_jwt` must be provided to identify the target Stytch User.
    #
    # This is an optional step in the OAuth flow. Stytch can often determine whether to create a new user or log in an existing one based on verified identity provider information. This endpoint is useful for cases where we can't, such as missing or unverified provider information.
    #
    # == Parameters:
    # provider::
    #   The OAuth provider's name.
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
    # oauth_attach_token::
    #   A single-use token for connecting the Stytch User selection from an OAuth Attach request to the corresponding OAuth Start request.
    #   The type of this field is +String+.
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    def attach(
      provider:,
      user_id: nil,
      session_token: nil,
      session_jwt: nil
    )
      headers = {}
      request = {
        provider: provider
      }
      request[:user_id] = user_id unless user_id.nil?
      request[:session_token] = session_token unless session_token.nil?
      request[:session_jwt] = session_jwt unless session_jwt.nil?

      post_request('/v1/oauth/attach', request, headers)
    end

    # Authenticate a User given a `token`. This endpoint verifies that the user completed the OAuth flow by verifying that the token is valid and hasn't expired. To initiate a Stytch session for the user while authenticating their OAuth token, include `session_duration_minutes`; a session with the identity provider, e.g. Google or Facebook, will always be initiated upon successful authentication.
    #
    # == Parameters:
    # token::
    #   The OAuth `token` from the `?token=` query parameter in the URL.
    #
    #       The redirect URL will look like `https://example.com/authenticate?stytch_token_type=oauth&token=rM_kw42CWBhsHLF62V75jELMbvJ87njMe3tFVj7Qupu7`
    #
    #       In the redirect URL, the `stytch_token_type` will be `oauth`. See [here](https://stytch.com/docs/guides/dashboard/redirect-urls) for more detail.
    #   The type of this field is +String+.
    # session_token::
    #   Reuse an existing session instead of creating a new one. If you provide us with a `session_token`, then we'll update the session represented by this session token with this OAuth factor. If this `session_token` belongs to a different user than the OAuth token, the session_jwt will be ignored. This endpoint will error if both `session_token` and `session_jwt` are provided.
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
    #   Reuse an existing session instead of creating a new one. If you provide us with a `session_jwt`, then we'll update the session represented by this JWT with this OAuth factor. If this `session_jwt` belongs to a different user than the OAuth token, the session_jwt will be ignored. This endpoint will error if both `session_token` and `session_jwt` are provided.
    #   The type of this field is nilable +String+.
    # session_custom_claims::
    #   Add a custom claims map to the Session being authenticated. Claims are only created if a Session is initialized by providing a value in `session_duration_minutes`. Claims will be included on the Session object and in the JWT. To update a key in an existing Session, supply a new value. To delete a key, supply a null value.
    #
    #   Custom claims made with reserved claims ("iss", "sub", "aud", "exp", "nbf", "iat", "jti") will be ignored. Total custom claims size cannot exceed four kilobytes.
    #   The type of this field is nilable +object+.
    # code_verifier::
    #   A base64url encoded one time secret used to validate that the request starts and ends on the same device.
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
    # provider_subject::
    #   The unique identifier for the User within a given OAuth provider. Also commonly called the "sub" or "Subject field" in OAuth protocols.
    #   The type of this field is +String+.
    # provider_type::
    #   Denotes the OAuth identity provider that the user has authenticated with, e.g. Google, Facebook, GitHub etc.
    #   The type of this field is +String+.
    # session_token::
    #   A secret token for a given Stytch Session.
    #   The type of this field is +String+.
    # session_jwt::
    #   The JSON Web Token (JWT) for a given Stytch Session.
    #   The type of this field is +String+.
    # provider_values::
    #   The `provider_values` object lists relevant identifiers, values, and scopes for a given OAuth provider. For example this object will include a provider's `access_token` that you can use to access the provider's API for a given user.
    #
    #   Note that these values will vary based on the OAuth provider in question, e.g. `id_token` is only returned by OIDC complaint identity providers.
    #   The type of this field is +ProviderValues+ (+object+).
    # user::
    #   The `user` object affected by this API call. See the [Get user endpoint](https://stytch.com/docs/api/get-user) for complete response field details.
    #   The type of this field is +User+ (+object+).
    # reset_sessions::
    #   Indicates if all other of the User's Sessions need to be reset. You should check this field if you aren't using Stytch's Session product. If you are using Stytch's Session product, we revoke the User's other sessions for you.
    #   The type of this field is +Boolean+.
    # oauth_user_registration_id::
    #   The unique ID for an OAuth registration.
    #   The type of this field is +String+.
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    # user_session::
    #   A `Session` object. For backwards compatibility reasons, the session from an OAuth authenticate call is labeled as `user_session`, but is otherwise just a standard stytch `Session` object.
    #
    #   See [GET sessions](https://stytch.com/docs/api/session-get) for complete response fields.
    #
    #   The type of this field is nilable +Session+ (+object+).
    def authenticate(
      token:,
      session_token: nil,
      session_duration_minutes: nil,
      session_jwt: nil,
      session_custom_claims: nil,
      code_verifier: nil
    )
      headers = {}
      request = {
        token: token
      }
      request[:session_token] = session_token unless session_token.nil?
      request[:session_duration_minutes] = session_duration_minutes unless session_duration_minutes.nil?
      request[:session_jwt] = session_jwt unless session_jwt.nil?
      request[:session_custom_claims] = session_custom_claims unless session_custom_claims.nil?
      request[:code_verifier] = code_verifier unless code_verifier.nil?

      post_request('/v1/oauth/authenticate', request, headers)
    end
  end
end
