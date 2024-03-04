# frozen_string_literal: true

# !!!
# WARNING: This file is autogenerated
# Only modify code within MANUAL() sections
# or your changes may be overwritten later!
# !!!

require_relative 'request_helper'

module StytchB2B
  class RecoveryCodes
    include Stytch::RequestHelper

    def initialize(connection)
      @connection = connection
    end

    # Allows a Member to complete an MFA flow by consuming a recovery code. This consumes the recovery code and returns a session token that can be used to authenticate the Member.
    #
    # == Parameters:
    # organization_id::
    #   Globally unique UUID that identifies a specific Organization. The `organization_id` is critical to perform operations on an Organization, so be sure to preserve this value.
    #   The type of this field is +String+.
    # member_id::
    #   Globally unique UUID that identifies a specific Member. The `member_id` is critical to perform operations on a Member, so be sure to preserve this value.
    #   The type of this field is +String+.
    # recovery_code::
    #   The recovery code generated by a secondary MFA method. This code is used to authenticate in place of the secondary MFA method if that method as a backup.
    #   The type of this field is +String+.
    # intermediate_session_token::
    #   The Intermediate Session Token. This token does not necessarily belong to a specific instance of a Member, but represents a bag of factors that may be converted to a member session.
    #     The token can be used with the [OTP SMS Authenticate endpoint](https://stytch.com/docs/b2b/api/authenticate-otp-sms), [TOTP Authenticate endpoint](https://stytch.com/docs/b2b/api/authenticate-totp),
    #     or [Recovery Codes Recover endpoint](https://stytch.com/docs/b2b/api/recovery-codes-recover) to complete an MFA flow;
    #     the [Exchange Intermediate Session endpoint](https://stytch.com/docs/b2b/api/exchange-intermediate-session) to join a specific Organization that allows the factors represented by the intermediate session token;
    #     or the [Create Organization via Discovery endpoint](https://stytch.com/docs/b2b/api/create-organization-via-discovery) to create a new Organization and Member.
    #   The type of this field is nilable +String+.
    # session_token::
    #   A secret token for a given Stytch Session.
    #   The type of this field is nilable +String+.
    # session_jwt::
    #   The JSON Web Token (JWT) for a given Stytch Session.
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
    #   If the `session_duration_minutes` parameter is not specified, a Stytch session will be created with a 60 minute duration. If you don't want
    #   to use the Stytch session product, you can ignore the session fields in the response.
    #   The type of this field is nilable +Integer+.
    # session_custom_claims::
    #   Add a custom claims map to the Session being authenticated. Claims are only created if a Session is initialized by providing a value in
    #   `session_duration_minutes`. Claims will be included on the Session object and in the JWT. To update a key in an existing Session, supply a new value. To
    #   delete a key, supply a null value. Custom claims made with reserved claims (`iss`, `sub`, `aud`, `exp`, `nbf`, `iat`, `jti`) will be ignored.
    #   Total custom claims size cannot exceed four kilobytes.
    #   The type of this field is nilable +object+.
    #
    # == Returns:
    # An object with the following fields:
    # request_id::
    #   Globally unique UUID that is returned with every API call. This value is important to log for debugging purposes; we may ask for this value to help identify a specific API call when helping you debug an issue.
    #   The type of this field is +String+.
    # member_id::
    #   Globally unique UUID that identifies a specific Member.
    #   The type of this field is +String+.
    # member::
    #   The [Member object](https://stytch.com/docs/b2b/api/member-object)
    #   The type of this field is +Member+ (+object+).
    # organization::
    #   The [Organization object](https://stytch.com/docs/b2b/api/organization-object).
    #   The type of this field is +Organization+ (+object+).
    # session_token::
    #   A secret token for a given Stytch Session.
    #   The type of this field is +String+.
    # session_jwt::
    #   The JSON Web Token (JWT) for a given Stytch Session.
    #   The type of this field is +String+.
    # recovery_codes_remaining::
    #   The number of recovery codes remaining for a Member.
    #   The type of this field is +Integer+.
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    # member_session::
    #   The [Session object](https://stytch.com/docs/b2b/api/session-object).
    #   The type of this field is nilable +MemberSession+ (+object+).
    def recover(
      organization_id:,
      member_id:,
      recovery_code:,
      intermediate_session_token: nil,
      session_token: nil,
      session_jwt: nil,
      session_duration_minutes: nil,
      session_custom_claims: nil
    )
      headers = {}
      request = {
        organization_id: organization_id,
        member_id: member_id,
        recovery_code: recovery_code
      }
      request[:intermediate_session_token] = intermediate_session_token unless intermediate_session_token.nil?
      request[:session_token] = session_token unless session_token.nil?
      request[:session_jwt] = session_jwt unless session_jwt.nil?
      request[:session_duration_minutes] = session_duration_minutes unless session_duration_minutes.nil?
      request[:session_custom_claims] = session_custom_claims unless session_custom_claims.nil?

      post_request('/v1/b2b/recovery_codes/recover', request, headers)
    end

    # Returns a Member's full set of active recovery codes.
    #
    # == Parameters:
    # organization_id::
    #   Globally unique UUID that identifies a specific Organization. The `organization_id` is critical to perform operations on an Organization, so be sure to preserve this value.
    #   The type of this field is +String+.
    # member_id::
    #   Globally unique UUID that identifies a specific Member. The `member_id` is critical to perform operations on a Member, so be sure to preserve this value.
    #   The type of this field is +String+.
    #
    # == Returns:
    # An object with the following fields:
    # request_id::
    #   Globally unique UUID that is returned with every API call. This value is important to log for debugging purposes; we may ask for this value to help identify a specific API call when helping you debug an issue.
    #   The type of this field is +String+.
    # member_id::
    #   Globally unique UUID that identifies a specific Member.
    #   The type of this field is +String+.
    # member::
    #   The [Member object](https://stytch.com/docs/b2b/api/member-object)
    #   The type of this field is +Member+ (+object+).
    # organization::
    #   The [Organization object](https://stytch.com/docs/b2b/api/organization-object).
    #   The type of this field is +Organization+ (+object+).
    # recovery_codes::
    #   An array of recovery codes that can be used to recover a Member's account.
    #   The type of this field is list of +String+.
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    def get(
      organization_id:,
      member_id:
    )
      headers = {}
      query_params = {}
      request = request_with_query_params("/v1/b2b/recovery_codes/#{organization_id}/#{member_id}", query_params)
      get_request(request, headers)
    end

    # Rotate a Member's recovery codes. This invalidates all existing recovery codes and generates a new set of recovery codes.
    #
    # == Parameters:
    # organization_id::
    #   Globally unique UUID that identifies a specific Organization. The `organization_id` is critical to perform operations on an Organization, so be sure to preserve this value.
    #   The type of this field is +String+.
    # member_id::
    #   Globally unique UUID that identifies a specific Member. The `member_id` is critical to perform operations on a Member, so be sure to preserve this value.
    #   The type of this field is +String+.
    #
    # == Returns:
    # An object with the following fields:
    # request_id::
    #   Globally unique UUID that is returned with every API call. This value is important to log for debugging purposes; we may ask for this value to help identify a specific API call when helping you debug an issue.
    #   The type of this field is +String+.
    # member_id::
    #   Globally unique UUID that identifies a specific Member.
    #   The type of this field is +String+.
    # member::
    #   The [Member object](https://stytch.com/docs/b2b/api/member-object)
    #   The type of this field is +Member+ (+object+).
    # organization::
    #   The [Organization object](https://stytch.com/docs/b2b/api/organization-object).
    #   The type of this field is +Organization+ (+object+).
    # recovery_codes::
    #   An array of recovery codes that can be used to recover a Member's account.
    #   The type of this field is list of +String+.
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    def rotate(
      organization_id:,
      member_id:
    )
      headers = {}
      request = {
        organization_id: organization_id,
        member_id: member_id
      }

      post_request('/v1/b2b/recovery_codes/rotate', request, headers)
    end
  end
end
