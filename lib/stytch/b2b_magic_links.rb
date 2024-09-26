# frozen_string_literal: true

# !!!
# WARNING: This file is autogenerated
# Only modify code within MANUAL() sections
# or your changes may be overwritten later!
# !!!

require_relative 'request_helper'

module StytchB2B
  class MagicLinks
    include Stytch::RequestHelper
    attr_reader :email, :discovery

    def initialize(connection)
      @connection = connection

      @email = StytchB2B::MagicLinks::Email.new(@connection)
      @discovery = StytchB2B::MagicLinks::Discovery.new(@connection)
    end

    # Authenticate a with a Magic Link. This endpoint requires a Magic Link token that is not expired or previously used. If the Member’s status is `pending` or `invited`, they will be updated to `active`.
    # Provide the `session_duration_minutes` parameter to set the lifetime of the session. If the `session_duration_minutes` parameter is not specified, a Stytch session will be created with a 60 minute duration.
    #
    # If the Member is required to complete MFA to log in to the, the returned value of `member_authenticated` will be `false`, and an `intermediate_session_token` will be returned.
    # The `intermediate_session_token` can be passed into the [OTP SMS Authenticate endpoint](https://stytch.com/docs/b2b/api/authenticate-otp-sms), [TOTP Authenticate endpoint](https://stytch.com/docs/b2b/api/authenticate-totp),
    # or [Recovery Codes Recover endpoint](https://stytch.com/docs/b2b/api/recovery-codes-recover) to complete the MFA step and acquire a full member session.
    # The `intermediate_session_token` can also be used with the [Exchange Intermediate Session endpoint](https://stytch.com/docs/b2b/api/exchange-intermediate-session) or the [Create Organization via Discovery endpoint](https://stytch.com/docs/b2b/api/create-organization-via-discovery) to join a different Organization or create a new one.
    # The `session_duration_minutes` and `session_custom_claims` parameters will be ignored.
    #
    # If a valid `session_token` or `session_jwt` is passed in, the Member will not be required to complete an MFA step.
    #
    # == Parameters:
    # magic_links_token::
    #   The Email Magic Link token to authenticate.
    #   The type of this field is +String+.
    # pkce_code_verifier::
    #   A base64url encoded one time secret used to validate that the request starts and ends on the same device.
    #   The type of this field is nilable +String+.
    # session_token::
    #   Reuse an existing session instead of creating a new one. If you provide a `session_token`, Stytch will update the session.
    #       If the `session_token` and `magic_links_token` belong to different Members, the `session_token` will be ignored. This endpoint will error if
    #       both `session_token` and `session_jwt` are provided.
    #   The type of this field is nilable +String+.
    # session_jwt::
    #   Reuse an existing session instead of creating a new one. If you provide a `session_jwt`, Stytch will update the session. If the `session_jwt`
    #       and `magic_links_token` belong to different Members, the `session_jwt` will be ignored. This endpoint will error if both `session_token` and `session_jwt`
    #       are provided.
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
    # locale::
    #   If the needs to complete an MFA step, and the Member has a phone number, this endpoint will pre-emptively send a one-time passcode (OTP) to the Member's phone number. The locale argument will be used to determine which language to use when sending the passcode.
    #
    # Parameter is a [IETF BCP 47 language tag](https://www.w3.org/International/articles/language-tags/), e.g. `"en"`.
    #
    # Currently supported languages are English (`"en"`), Spanish (`"es"`), and Brazilian Portuguese (`"pt-br"`); if no value is provided, the copy defaults to English.
    #
    # Request support for additional languages [here](https://docs.google.com/forms/d/e/1FAIpQLScZSpAu_m2AmLXRT3F3kap-s_mcV6UTBitYn6CdyWP0-o7YjQ/viewform?usp=sf_link")!
    #
    #   The type of this field is nilable +AuthenticateRequestLocale+ (string enum).
    # intermediate_session_token::
    #   Adds this primary authentication factor to the intermediate session token. If the resulting set of factors satisfies the organization's primary authentication requirements and MFA requirements, the intermediate session token will be consumed and converted to a member session. If not, the same intermediate session token will be returned.
    #   The type of this field is nilable +String+.
    #
    # == Returns:
    # An object with the following fields:
    # request_id::
    #   Globally unique UUID that is returned with every API call. This value is important to log for debugging purposes; we may ask for this value to help identify a specific API call when helping you debug an issue.
    #   The type of this field is +String+.
    # member_id::
    #   Globally unique UUID that identifies a specific Member.
    #   The type of this field is +String+.
    # method_id::
    #   The email or device involved in the authentication.
    #   The type of this field is +String+.
    # reset_sessions::
    #   Indicates if all Sessions linked to the Member need to be reset. You should check this field if you aren't using
    #     Stytch's Session product. If you are using Stytch's Session product, we revoke the Member’s other Sessions for you.
    #   The type of this field is +Boolean+.
    # organization_id::
    #   Globally unique UUID that identifies a specific Organization. The `organization_id` is critical to perform operations on an Organization, so be sure to preserve this value.
    #   The type of this field is +String+.
    # member::
    #   The [Member object](https://stytch.com/docs/b2b/api/member-object)
    #   The type of this field is +Member+ (+object+).
    # session_token::
    #   A secret token for a given Stytch Session.
    #   The type of this field is +String+.
    # session_jwt::
    #   The JSON Web Token (JWT) for a given Stytch Session.
    #   The type of this field is +String+.
    # organization::
    #   The [Organization object](https://stytch.com/docs/b2b/api/organization-object).
    #   The type of this field is +Organization+ (+object+).
    # intermediate_session_token::
    #   The returned Intermediate Session Token contains an Email Magic Link factor associated with the Member's email address. If this value is non-empty, the member must complete an MFA step to finish logging in to the Organization. The token can be used with the [OTP SMS Authenticate endpoint](https://stytch.com/docs/b2b/api/authenticate-otp-sms), [TOTP Authenticate endpoint](https://stytch.com/docs/b2b/api/authenticate-totp), or [Recovery Codes Recover endpoint](https://stytch.com/docs/b2b/api/recovery-codes-recover) to complete an MFA flow and log in to the Organization. It can also be used with the [Exchange Intermediate Session endpoint](https://stytch.com/docs/b2b/api/exchange-intermediate-session) to join a specific Organization that allows the factors represented by the intermediate session token; or the [Create Organization via Discovery endpoint](https://stytch.com/docs/b2b/api/create-organization-via-discovery) to create a new Organization and Member.
    #   The type of this field is +String+.
    # member_authenticated::
    #   Indicates whether the Member is fully authenticated. If false, the Member needs to complete an MFA step to log in to the Organization.
    #   The type of this field is +Boolean+.
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    # member_session::
    #   The [Session object](https://stytch.com/docs/b2b/api/session-object).
    #   The type of this field is nilable +MemberSession+ (+object+).
    # mfa_required::
    #   Information about the MFA requirements of the Organization and the Member's options for fulfilling MFA.
    #   The type of this field is nilable +MfaRequired+ (+object+).
    def authenticate(
      magic_links_token:,
      pkce_code_verifier: nil,
      session_token: nil,
      session_jwt: nil,
      session_duration_minutes: nil,
      session_custom_claims: nil,
      locale: nil,
      intermediate_session_token: nil
    )
      headers = {}
      request = {
        magic_links_token: magic_links_token
      }
      request[:pkce_code_verifier] = pkce_code_verifier unless pkce_code_verifier.nil?
      request[:session_token] = session_token unless session_token.nil?
      request[:session_jwt] = session_jwt unless session_jwt.nil?
      request[:session_duration_minutes] = session_duration_minutes unless session_duration_minutes.nil?
      request[:session_custom_claims] = session_custom_claims unless session_custom_claims.nil?
      request[:locale] = locale unless locale.nil?
      request[:intermediate_session_token] = intermediate_session_token unless intermediate_session_token.nil?

      post_request('/v1/b2b/magic_links/authenticate', request, headers)
    end

    class Email
      class InviteRequestOptions
        # Optional authorization object.
        # Pass in an active Stytch Member session token or session JWT and the request
        # will be run using that member's permissions.
        attr_accessor :authorization

        def initialize(
          authorization: nil
        )
          @authorization = authorization
        end

        def to_headers
          headers = {}
          headers.merge!(@authorization.to_headers) if authorization
          headers
        end
      end

      include Stytch::RequestHelper
      attr_reader :discovery

      def initialize(connection)
        @connection = connection

        @discovery = StytchB2B::MagicLinks::Email::Discovery.new(@connection)
      end

      # Send either a login or signup magic link to a Member. A new, pending, or invited Member will receive a signup Email Magic Link. Members will have a `pending` status until they successfully authenticate. An active Member will receive a login Email Magic Link.
      #
      # The magic link is valid for 60 minutes.
      #
      # == Parameters:
      # organization_id::
      #   Globally unique UUID that identifies a specific Organization. The `organization_id` is critical to perform operations on an Organization, so be sure to preserve this value.
      #   The type of this field is +String+.
      # email_address::
      #   The email address of the Member.
      #   The type of this field is +String+.
      # login_redirect_url::
      #   The URL that the Member clicks from the login Email Magic Link. This URL should be an endpoint in the backend server that
      #   verifies the request by querying Stytch's authenticate endpoint and finishes the login. If this value is not passed, the default login
      #   redirect URL that you set in your Dashboard is used. If you have not set a default login redirect URL, an error is returned.
      #   The type of this field is nilable +String+.
      # signup_redirect_url::
      #   The URL the Member clicks from the signup Email Magic Link. This URL should be an endpoint in the backend server that verifies
      #   the request by querying Stytch's authenticate endpoint and finishes the login. If this value is not passed, the default sign-up redirect URL
      #   that you set in your Dashboard is used. If you have not set a default sign-up redirect URL, an error is returned.
      #   The type of this field is nilable +String+.
      # pkce_code_challenge::
      #   A base64url encoded SHA256 hash of a one time secret used to validate that the request starts and ends on the same device.
      #   The type of this field is nilable +String+.
      # login_template_id::
      #   Use a custom template for login emails. By default, it will use your default email template. The template must be from Stytch's
      # built-in customizations or a custom HTML email for Magic Links - Login.
      #   The type of this field is nilable +String+.
      # signup_template_id::
      #   Use a custom template for signup emails. By default, it will use your default email template. The template must be from Stytch's
      # built-in customizations or a custom HTML email for Magic Links - Signup.
      #   The type of this field is nilable +String+.
      # locale::
      #   Used to determine which language to use when sending the user this delivery method. Parameter is a [IETF BCP 47 language tag](https://www.w3.org/International/articles/language-tags/), e.g. `"en"`.
      #
      # Currently supported languages are English (`"en"`), Spanish (`"es"`), and Brazilian Portuguese (`"pt-br"`); if no value is provided, the copy defaults to English.
      #
      # Request support for additional languages [here](https://docs.google.com/forms/d/e/1FAIpQLScZSpAu_m2AmLXRT3F3kap-s_mcV6UTBitYn6CdyWP0-o7YjQ/viewform?usp=sf_link")!
      #
      #   The type of this field is nilable +LoginOrSignupRequestLocale+ (string enum).
      #
      # == Returns:
      # An object with the following fields:
      # request_id::
      #   Globally unique UUID that is returned with every API call. This value is important to log for debugging purposes; we may ask for this value to help identify a specific API call when helping you debug an issue.
      #   The type of this field is +String+.
      # member_id::
      #   Globally unique UUID that identifies a specific Member.
      #   The type of this field is +String+.
      # member_created::
      #   A flag indicating `true` if a new Member object was created and `false` if the Member object already existed.
      #   The type of this field is +Boolean+.
      # member::
      #   The [Member object](https://stytch.com/docs/b2b/api/member-object)
      #   The type of this field is +Member+ (+object+).
      # organization::
      #   The [Organization object](https://stytch.com/docs/b2b/api/organization-object).
      #   The type of this field is +Organization+ (+object+).
      # status_code::
      #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
      #   The type of this field is +Integer+.
      def login_or_signup(
        organization_id:,
        email_address:,
        login_redirect_url: nil,
        signup_redirect_url: nil,
        pkce_code_challenge: nil,
        login_template_id: nil,
        signup_template_id: nil,
        locale: nil
      )
        headers = {}
        request = {
          organization_id: organization_id,
          email_address: email_address
        }
        request[:login_redirect_url] = login_redirect_url unless login_redirect_url.nil?
        request[:signup_redirect_url] = signup_redirect_url unless signup_redirect_url.nil?
        request[:pkce_code_challenge] = pkce_code_challenge unless pkce_code_challenge.nil?
        request[:login_template_id] = login_template_id unless login_template_id.nil?
        request[:signup_template_id] = signup_template_id unless signup_template_id.nil?
        request[:locale] = locale unless locale.nil?

        post_request('/v1/b2b/magic_links/email/login_or_signup', request, headers)
      end

      # Send an invite email to a new to join an. The Member will be created with an `invited` status until they successfully authenticate. Sending invites to `pending` Members will update their status to `invited`. Sending invites to already `active` Members will return an error.
      #
      # The magic link invite will be valid for 1 week.
      #
      # == Parameters:
      # organization_id::
      #   Globally unique UUID that identifies a specific Organization. The `organization_id` is critical to perform operations on an Organization, so be sure to preserve this value.
      #   The type of this field is +String+.
      # email_address::
      #   The email address of the Member.
      #   The type of this field is +String+.
      # invite_redirect_url::
      #   The URL that the Member clicks from the invite Email Magic Link. This URL should be an endpoint in the backend server that verifies
      #   the request by querying Stytch's authenticate endpoint and finishes the invite flow. If this value is not passed, the default `invite_redirect_url`
      #   that you set in your Dashboard is used. If you have not set a default `invite_redirect_url`, an error is returned.
      #   The type of this field is nilable +String+.
      # invited_by_member_id::
      #   The `member_id` of the Member who sends the invite.
      #   The type of this field is nilable +String+.
      # name::
      #   The name of the Member.
      #   The type of this field is nilable +String+.
      # trusted_metadata::
      #   An arbitrary JSON object for storing application-specific data or identity-provider-specific data.
      #   The type of this field is nilable +object+.
      # untrusted_metadata::
      #   An arbitrary JSON object of application-specific data. These fields can be edited directly by the
      #   frontend SDK, and should not be used to store critical information. See the [Metadata resource](https://stytch.com/docs/b2b/api/metadata)
      #   for complete field behavior details.
      #   The type of this field is nilable +object+.
      # invite_template_id::
      #   Use a custom template for invite emails. By default, it will use your default email template. The template must be a template
      #   using our built-in customizations or a custom HTML email for Magic Links - Invite.
      #   The type of this field is nilable +String+.
      # locale::
      #   Used to determine which language to use when sending the user this delivery method. Parameter is a [IETF BCP 47 language tag](https://www.w3.org/International/articles/language-tags/), e.g. `"en"`.
      #
      # Currently supported languages are English (`"en"`), Spanish (`"es"`), and Brazilian Portuguese (`"pt-br"`); if no value is provided, the copy defaults to English.
      #
      # Request support for additional languages [here](https://docs.google.com/forms/d/e/1FAIpQLScZSpAu_m2AmLXRT3F3kap-s_mcV6UTBitYn6CdyWP0-o7YjQ/viewform?usp=sf_link")!
      #
      #   The type of this field is nilable +InviteRequestLocale+ (string enum).
      # roles::
      #   Roles to explicitly assign to this Member. See the [RBAC guide](https://stytch.com/docs/b2b/guides/rbac/role-assignment)
      #    for more information about role assignment.
      #   The type of this field is nilable list of +String+.
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
      # status_code::
      #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
      #   The type of this field is +Integer+.
      #
      # == Method Options:
      # This method supports an optional +StytchB2B::MagicLinks::Email::InviteRequestOptions+ object which will modify the headers sent in the HTTP request.
      def invite(
        organization_id:,
        email_address:,
        invite_redirect_url: nil,
        invited_by_member_id: nil,
        name: nil,
        trusted_metadata: nil,
        untrusted_metadata: nil,
        invite_template_id: nil,
        locale: nil,
        roles: nil,
        method_options: nil
      )
        headers = {}
        headers = headers.merge(method_options.to_headers) unless method_options.nil?
        request = {
          organization_id: organization_id,
          email_address: email_address
        }
        request[:invite_redirect_url] = invite_redirect_url unless invite_redirect_url.nil?
        request[:invited_by_member_id] = invited_by_member_id unless invited_by_member_id.nil?
        request[:name] = name unless name.nil?
        request[:trusted_metadata] = trusted_metadata unless trusted_metadata.nil?
        request[:untrusted_metadata] = untrusted_metadata unless untrusted_metadata.nil?
        request[:invite_template_id] = invite_template_id unless invite_template_id.nil?
        request[:locale] = locale unless locale.nil?
        request[:roles] = roles unless roles.nil?

        post_request('/v1/b2b/magic_links/email/invite', request, headers)
      end

      class Discovery
        include Stytch::RequestHelper

        def initialize(connection)
          @connection = connection
        end

        # Send a discovery magic link to an email address. The magic link is valid for 60 minutes.
        #
        # == Parameters:
        # email_address::
        #   The email address of the Member.
        #   The type of this field is +String+.
        # discovery_redirect_url::
        #   The URL that the end user clicks from the discovery Magic Link. This URL should be an endpoint in the backend server that
        #   verifies the request by querying Stytch's discovery authenticate endpoint and continues the flow. If this value is not passed, the default
        #   discovery redirect URL that you set in your Dashboard is used. If you have not set a default discovery redirect URL, an error is returned.
        #   The type of this field is nilable +String+.
        # pkce_code_challenge::
        #   A base64url encoded SHA256 hash of a one time secret used to validate that the request starts and ends on the same device.
        #   The type of this field is nilable +String+.
        # login_template_id::
        #   Use a custom template for discovery emails. By default, it will use your default email template. The template must be from Stytch's
        # built-in customizations or a custom HTML email for Magic Links - Login.
        #   The type of this field is nilable +String+.
        # locale::
        #   Used to determine which language to use when sending the user this delivery method. Parameter is a [IETF BCP 47 language tag](https://www.w3.org/International/articles/language-tags/), e.g. `"en"`.
        #
        # Currently supported languages are English (`"en"`), Spanish (`"es"`), and Brazilian Portuguese (`"pt-br"`); if no value is provided, the copy defaults to English.
        #
        # Request support for additional languages [here](https://docs.google.com/forms/d/e/1FAIpQLScZSpAu_m2AmLXRT3F3kap-s_mcV6UTBitYn6CdyWP0-o7YjQ/viewform?usp=sf_link")!
        #
        #   The type of this field is nilable +SendRequestLocale+ (string enum).
        #
        # == Returns:
        # An object with the following fields:
        # request_id::
        #   Globally unique UUID that is returned with every API call. This value is important to log for debugging purposes; we may ask for this value to help identify a specific API call when helping you debug an issue.
        #   The type of this field is +String+.
        # status_code::
        #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
        #   The type of this field is +Integer+.
        def send(
          email_address:,
          discovery_redirect_url: nil,
          pkce_code_challenge: nil,
          login_template_id: nil,
          locale: nil
        )
          headers = {}
          request = {
            email_address: email_address
          }
          request[:discovery_redirect_url] = discovery_redirect_url unless discovery_redirect_url.nil?
          request[:pkce_code_challenge] = pkce_code_challenge unless pkce_code_challenge.nil?
          request[:login_template_id] = login_template_id unless login_template_id.nil?
          request[:locale] = locale unless locale.nil?

          post_request('/v1/b2b/magic_links/email/discovery/send', request, headers)
        end
      end
    end

    class Discovery
      include Stytch::RequestHelper

      def initialize(connection)
        @connection = connection
      end

      # Authenticates the Discovery Magic Link token and exchanges it for an Intermediate Session Token. Intermediate Session Tokens can be used for various Discovery login flows and are valid for 10 minutes.
      #
      # == Parameters:
      # discovery_magic_links_token::
      #   The Discovery Email Magic Link token to authenticate.
      #   The type of this field is +String+.
      # pkce_code_verifier::
      #   A base64url encoded one time secret used to validate that the request starts and ends on the same device.
      #   The type of this field is nilable +String+.
      #
      # == Returns:
      # An object with the following fields:
      # request_id::
      #   Globally unique UUID that is returned with every API call. This value is important to log for debugging purposes; we may ask for this value to help identify a specific API call when helping you debug an issue.
      #   The type of this field is +String+.
      # intermediate_session_token::
      #   The Intermediate Session Token. This token does not necessarily belong to a specific instance of a Member, but represents a bag of factors that may be converted to a member session. The token can be used with the [OTP SMS Authenticate endpoint](https://stytch.com/docs/b2b/api/authenticate-otp-sms), [TOTP Authenticate endpoint](https://stytch.com/docs/b2b/api/authenticate-totp), or [Recovery Codes Recover endpoint](https://stytch.com/docs/b2b/api/recovery-codes-recover) to complete an MFA flow and log in to the Organization. It can also be used with the [Exchange Intermediate Session endpoint](https://stytch.com/docs/b2b/api/exchange-intermediate-session) to join a specific Organization that allows the factors represented by the intermediate session token; or the [Create Organization via Discovery endpoint](https://stytch.com/docs/b2b/api/create-organization-via-discovery) to create a new Organization and Member.
      #   The type of this field is +String+.
      # email_address::
      #   The email address.
      #   The type of this field is +String+.
      # discovered_organizations::
      #   An array of `discovered_organization` objects tied to the `intermediate_session_token`, `session_token`, or `session_jwt`. See the [Discovered Organization Object](https://stytch.com/docs/b2b/api/discovered-organization-object) for complete details.
      #
      #   Note that Organizations will only appear here under any of the following conditions:
      #   1. The end user is already a Member of the Organization.
      #   2. The end user is invited to the Organization.
      #   3. The end user can join the Organization because:
      #
      #       a) The Organization allows JIT provisioning.
      #
      #       b) The Organizations' allowed domains list contains the Member's email domain.
      #
      #       c) The Organization has at least one other Member with a verified email address with the same domain as the end user (to prevent phishing attacks).
      #   The type of this field is list of +DiscoveredOrganization+ (+object+).
      # status_code::
      #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
      #   The type of this field is +Integer+.
      def authenticate(
        discovery_magic_links_token:,
        pkce_code_verifier: nil
      )
        headers = {}
        request = {
          discovery_magic_links_token: discovery_magic_links_token
        }
        request[:pkce_code_verifier] = pkce_code_verifier unless pkce_code_verifier.nil?

        post_request('/v1/b2b/magic_links/discovery/authenticate', request, headers)
      end
    end
  end
end
