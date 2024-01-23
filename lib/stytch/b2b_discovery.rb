# frozen_string_literal: true

# !!!
# WARNING: This file is autogenerated
# Only modify code within MANUAL() sections
# or your changes may be overwritten later!
# !!!

require_relative 'request_helper'

module StytchB2B
  class Discovery
    include Stytch::RequestHelper
    attr_reader :intermediate_sessions, :organizations

    def initialize(connection)
      @connection = connection

      @intermediate_sessions = StytchB2B::Discovery::IntermediateSessions.new(@connection)
      @organizations = StytchB2B::Discovery::Organizations.new(@connection)
    end

    class IntermediateSessions
      include Stytch::RequestHelper

      def initialize(connection)
        @connection = connection
      end

      # Exchange an Intermediate Session for a fully realized [Member Session](https://stytch.com/docs/b2b/api/session-object) in a desired [Organization](https://stytch.com/docs/b2b/api/organization-object).
      # This operation consumes the Intermediate Session.
      #
      # This endpoint can be used to accept invites and create new members via domain matching.
      #
      # If the Member is required to complete MFA to log in to the Organization, the returned value of `member_authenticated` will be `false`.
      # The `intermediate_session_token` will not be consumed and instead will be returned in the response.
      # The `intermediate_session_token` can be passed into the [OTP SMS Authenticate endpoint](https://stytch.com/docs/b2b/api/authenticate-otp-sms) to complete the MFA step and acquire a full member session.
      # The `intermediate_session_token` can also be used with the [Exchange Intermediate Session endpoint](https://stytch.com/docs/b2b/api/exchange-intermediate-session) or the [Create Organization via Discovery endpoint](https://stytch.com/docs/b2b/api/create-organization-via-discovery) to join a different Organization or create a new one.
      # The `session_duration_minutes` and `session_custom_claims` parameters will be ignored.
      #
      # == Parameters:
      # intermediate_session_token::
      #   The Intermediate Session Token. This token does not necessarily belong to a specific instance of a Member, but represents a bag of factors that may be converted to a member session.
      #     The token can be used with the [OTP SMS Authenticate endpoint](https://stytch.com/docs/b2b/api/authenticate-otp-sms) to complete an MFA flow;
      #     the [Exchange Intermediate Session endpoint](https://stytch.com/docs/b2b/api/exchange-intermediate-session) to join a specific Organization that allows the factors represented by the intermediate session token;
      #     or the [Create Organization via Discovery endpoint](https://stytch.com/docs/b2b/api/create-organization-via-discovery) to create a new Organization and Member.
      #   The type of this field is +String+.
      # organization_id::
      #   Globally unique UUID that identifies a specific Organization. The `organization_id` is critical to perform operations on an Organization, so be sure to preserve this value.
      #   The type of this field is +String+.
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
      #   If the Member needs to complete an MFA step, and the Member has a phone number, this endpoint will pre-emptively send a one-time passcode (OTP) to the Member's phone number. The locale argument will be used to determine which language to use when sending the passcode.
      #
      # Parameter is a [IETF BCP 47 language tag](https://www.w3.org/International/articles/language-tags/), e.g. `"en"`.
      #
      # Currently supported languages are English (`"en"`), Spanish (`"es"`), and Brazilian Portuguese (`"pt-br"`); if no value is provided, the copy defaults to English.
      #
      # Request support for additional languages [here](https://docs.google.com/forms/d/e/1FAIpQLScZSpAu_m2AmLXRT3F3kap-s_mcV6UTBitYn6CdyWP0-o7YjQ/viewform?usp=sf_link")!
      #
      #   The type of this field is nilable +ExchangeRequestLocale+ (string enum).
      #
      # == Returns:
      # An object with the following fields:
      # request_id::
      #   Globally unique UUID that is returned with every API call. This value is important to log for debugging purposes; we may ask for this value to help identify a specific API call when helping you debug an issue.
      #   The type of this field is +String+.
      # member_id::
      #   Globally unique UUID that identifies a specific Member.
      #   The type of this field is +String+.
      # session_token::
      #   A secret token for a given Stytch Session.
      #   The type of this field is +String+.
      # session_jwt::
      #   The JSON Web Token (JWT) for a given Stytch Session.
      #   The type of this field is +String+.
      # member::
      #   The [Member object](https://stytch.com/docs/b2b/api/member-object)
      #   The type of this field is +Member+ (+object+).
      # organization::
      #   The [Organization object](https://stytch.com/docs/b2b/api/organization-object).
      #   The type of this field is +Organization+ (+object+).
      # member_authenticated::
      #   Indicates whether the Member is fully authenticated. If false, the Member needs to complete an MFA step to log in to the Organization.
      #   The type of this field is +Boolean+.
      # intermediate_session_token::
      #   The returned Intermediate Session Token is identical to the one that was originally passed in to the request.
      #       The token can be used with the [OTP SMS Authenticate endpoint](https://stytch.com/docs/b2b/api/authenticate-otp-sms) to complete the MFA flow and log in to the Organization.
      #       It can also be used with the [Exchange Intermediate Session endpoint](https://stytch.com/docs/b2b/api/exchange-intermediate-session) to join a different existing Organization,
      #       or the [Create Organization via Discovery endpoint](https://stytch.com/docs/b2b/api/create-organization-via-discovery) to create a new Organization.
      #   The type of this field is +String+.
      # status_code::
      #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
      #   The type of this field is +Integer+.
      # member_session::
      #   The [Session object](https://stytch.com/docs/b2b/api/session-object).
      #   The type of this field is nilable +MemberSession+ (+object+).
      # mfa_required::
      #   Information about the MFA requirements of the Organization and the Member's options for fulfilling MFA.
      #   The type of this field is nilable +MfaRequired+ (+object+).
      def exchange(
        intermediate_session_token:,
        organization_id:,
        session_duration_minutes: nil,
        session_custom_claims: nil,
        locale: nil
      )
        headers = {}
        request = {
          intermediate_session_token: intermediate_session_token,
          organization_id: organization_id
        }
        request[:session_duration_minutes] = session_duration_minutes unless session_duration_minutes.nil?
        request[:session_custom_claims] = session_custom_claims unless session_custom_claims.nil?
        request[:locale] = locale unless locale.nil?

        post_request('/v1/b2b/discovery/intermediate_sessions/exchange', request, headers)
      end
    end

    class Organizations
      include Stytch::RequestHelper

      def initialize(connection)
        @connection = connection
      end

      # If an end user does not want to join any already-existing Organization, or has no possible Organizations to join, this endpoint can be used to create a new
      # [Organization](https://stytch.com/docs/b2b/api/organization-object) and [Member](https://stytch.com/docs/b2b/api/member-object).
      #
      # This operation consumes the Intermediate Session.
      #
      # This endpoint will also create an initial Member Session for the newly created Member.
      #
      # The Member created by this endpoint will automatically be granted the `stytch_admin` Role. See the
      # [RBAC guide](https://stytch.com/docs/b2b/guides/rbac/stytch-defaults) for more details on this Role.
      #
      # If the new Organization is created with a `mfa_policy` of `REQUIRED_FOR_ALL`, the newly created Member will need to complete an MFA step to log in to the Organization.
      # The `intermediate_session_token` will not be consumed and instead will be returned in the response.
      # The `intermediate_session_token` can be passed into the [OTP SMS Authenticate endpoint](https://stytch.com/docs/b2b/api/authenticate-otp-sms) to complete the MFA step and acquire a full member session.
      # The `intermediate_session_token` can also be used with the [Exchange Intermediate Session endpoint](https://stytch.com/docs/b2b/api/exchange-intermediate-session) or the [Create Organization via Discovery endpoint](https://stytch.com/docs/b2b/api/create-organization-via-discovery) to join a different Organization or create a new one.
      # The `session_duration_minutes` and `session_custom_claims` parameters will be ignored.
      #
      # == Parameters:
      # intermediate_session_token::
      #   The Intermediate Session Token. This token does not necessarily belong to a specific instance of a Member, but represents a bag of factors that may be converted to a member session.
      #     The token can be used with the [OTP SMS Authenticate endpoint](https://stytch.com/docs/b2b/api/authenticate-otp-sms) to complete an MFA flow;
      #     the [Exchange Intermediate Session endpoint](https://stytch.com/docs/b2b/api/exchange-intermediate-session) to join a specific Organization that allows the factors represented by the intermediate session token;
      #     or the [Create Organization via Discovery endpoint](https://stytch.com/docs/b2b/api/create-organization-via-discovery) to create a new Organization and Member.
      #   The type of this field is +String+.
      # organization_name::
      #   The name of the Organization. If the name is not specified, a default name will be created based on the email used to initiate the discovery flow. If the email domain is a common email provider such as gmail.com, or if the email is a .edu email, the organization name will be generated based on the name portion of the email. Otherwise, the organization name will be generated based on the email domain.
      #   The type of this field is +String+.
      # organization_slug::
      #   The unique URL slug of the Organization. A minimum of two characters is required. The slug only accepts alphanumeric characters and the following reserved characters: `-` `.` `_` `~`. If the slug is not specified, a default slug will be created based on the email used to initiate the discovery flow. If the email domain is a common email provider such as gmail.com, or if the email is a .edu email, the organization slug will be generated based on the name portion of the email. Otherwise, the organization slug will be generated based on the email domain.
      #   The type of this field is +String+.
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
      # organization_logo_url::
      #   The image URL of the Organization logo.
      #   The type of this field is nilable +String+.
      # trusted_metadata::
      #   An arbitrary JSON object for storing application-specific data or identity-provider-specific data.
      #   The type of this field is nilable +object+.
      # sso_jit_provisioning::
      #   The authentication setting that controls the JIT provisioning of Members when authenticating via SSO. The accepted values are:
      #
      #   `ALL_ALLOWED` – new Members will be automatically provisioned upon successful authentication via any of the Organization's `sso_active_connections`.
      #
      #   `RESTRICTED` – only new Members with SSO logins that comply with `sso_jit_provisioning_allowed_connections` can be provisioned upon authentication.
      #
      #   `NOT_ALLOWED` – disable JIT provisioning via SSO.
      #
      #   The type of this field is nilable +String+.
      # email_allowed_domains::
      #   An array of email domains that allow invites or JIT provisioning for new Members. This list is enforced when either `email_invites` or `email_jit_provisioning` is set to `RESTRICTED`.
      #
      #
      #     Common domains such as `gmail.com` are not allowed. See the [common email domains resource](https://stytch.com/docs/b2b/api/common-email-domains) for the full list.
      #   The type of this field is nilable list of +String+.
      # email_jit_provisioning::
      #   The authentication setting that controls how a new Member can be provisioned by authenticating via Email Magic Link or OAuth. The accepted values are:
      #
      #   `RESTRICTED` – only new Members with verified emails that comply with `email_allowed_domains` can be provisioned upon authentication via Email Magic Link or OAuth.
      #
      #   `NOT_ALLOWED` – disable JIT provisioning via Email Magic Link and OAuth.
      #
      #   The type of this field is nilable +String+.
      # email_invites::
      #   The authentication setting that controls how a new Member can be invited to an organization by email. The accepted values are:
      #
      #   `ALL_ALLOWED` – any new Member can be invited to join via email.
      #
      #   `RESTRICTED` – only new Members with verified emails that comply with `email_allowed_domains` can be invited via email.
      #
      #   `NOT_ALLOWED` – disable email invites.
      #
      #   The type of this field is nilable +String+.
      # auth_methods::
      #   The setting that controls which authentication methods can be used by Members of an Organization. The accepted values are:
      #
      #   `ALL_ALLOWED` – the default setting which allows all authentication methods to be used.
      #
      #   `RESTRICTED` – only methods that comply with `allowed_auth_methods` can be used for authentication. This setting does not apply to Members with `is_breakglass` set to `true`.
      #
      #   The type of this field is nilable +String+.
      # allowed_auth_methods::
      #   An array of allowed authentication methods. This list is enforced when `auth_methods` is set to `RESTRICTED`.
      #   The list's accepted values are: `sso`, `magic_link`, `password`, `google_oauth`, and `microsoft_oauth`.
      #
      #   The type of this field is nilable list of +String+.
      # mfa_policy::
      #   The setting that controls the MFA policy for all Members in the Organization. The accepted values are:
      #
      #   `REQUIRED_FOR_ALL` – All Members within the Organization will be required to complete MFA every time they wish to log in. However, any active Session that existed prior to this setting change will remain valid.
      #
      #   `OPTIONAL` – The default value. The Organization does not require MFA by default for all Members. Members will be required to complete MFA only if their `mfa_enrolled` status is set to true.
      #
      #   The type of this field is nilable +String+.
      # rbac_email_implicit_role_assignments::
      #   Implicit role assignments based off of email domains.
      #   For each domain-Role pair, all Members whose email addresses have the specified email domain will be granted the
      #   associated Role, regardless of their login method. See the [RBAC guide](https://stytch.com/docs/b2b/guides/rbac/role-assignment)
      #   for more information about role assignment.
      #   The type of this field is nilable list of +EmailImplicitRoleAssignment+ (+object+).
      # mfa_methods::
      #   The setting that controls which mfa methods can be used by Members of an Organization. The accepted values are:
      #
      #   `ALL_ALLOWED` – the default setting which allows all authentication methods to be used.
      #
      #   `RESTRICTED` – only methods that comply with `allowed_auth_methods` can be used for authentication. This setting does not apply to Members with `is_breakglass` set to `true`.
      #
      #   The type of this field is nilable +String+.
      # allowed_mfa_methods::
      #   An array of allowed mfa authentication methods. This list is enforced when `mfa_methods` is set to `RESTRICTED`.
      #   The list's accepted values are: `sms_otp` and `totp`.
      #
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
      # session_token::
      #   A secret token for a given Stytch Session.
      #   The type of this field is +String+.
      # session_jwt::
      #   The JSON Web Token (JWT) for a given Stytch Session.
      #   The type of this field is +String+.
      # member::
      #   The [Member object](https://stytch.com/docs/b2b/api/member-object)
      #   The type of this field is +Member+ (+object+).
      # member_authenticated::
      #   Indicates whether the Member is fully authenticated. If false, the Member needs to complete an MFA step to log in to the Organization.
      #   The type of this field is +Boolean+.
      # intermediate_session_token::
      #   The returned Intermediate Session Token is identical to the one that was originally passed in to the request.
      #       The token can be used with the [OTP SMS Authenticate endpoint](https://stytch.com/docs/b2b/api/authenticate-otp-sms) to complete the MFA flow and log in to the Organization.
      #       It can also be used with the [Exchange Intermediate Session endpoint](https://stytch.com/docs/b2b/api/exchange-intermediate-session) to join a different existing Organization,
      #       or the [Create Organization via Discovery endpoint](https://stytch.com/docs/b2b/api/create-organization-via-discovery) to create a new Organization.
      #   The type of this field is +String+.
      # status_code::
      #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
      #   The type of this field is +Integer+.
      # member_session::
      #   The [Session object](https://stytch.com/docs/b2b/api/session-object).
      #   The type of this field is nilable +MemberSession+ (+object+).
      # organization::
      #   The [Organization object](https://stytch.com/docs/b2b/api/organization-object).
      #   The type of this field is nilable +Organization+ (+object+).
      # mfa_required::
      #   Information about the MFA requirements of the Organization and the Member's options for fulfilling MFA.
      #   The type of this field is nilable +MfaRequired+ (+object+).
      def create(
        intermediate_session_token:,
        organization_name:,
        organization_slug:,
        session_duration_minutes: nil,
        session_custom_claims: nil,
        organization_logo_url: nil,
        trusted_metadata: nil,
        sso_jit_provisioning: nil,
        email_allowed_domains: nil,
        email_jit_provisioning: nil,
        email_invites: nil,
        auth_methods: nil,
        allowed_auth_methods: nil,
        mfa_policy: nil,
        rbac_email_implicit_role_assignments: nil,
        mfa_methods: nil,
        allowed_mfa_methods: nil
      )
        headers = {}
        request = {
          intermediate_session_token: intermediate_session_token,
          organization_name: organization_name,
          organization_slug: organization_slug
        }
        request[:session_duration_minutes] = session_duration_minutes unless session_duration_minutes.nil?
        request[:session_custom_claims] = session_custom_claims unless session_custom_claims.nil?
        request[:organization_logo_url] = organization_logo_url unless organization_logo_url.nil?
        request[:trusted_metadata] = trusted_metadata unless trusted_metadata.nil?
        request[:sso_jit_provisioning] = sso_jit_provisioning unless sso_jit_provisioning.nil?
        request[:email_allowed_domains] = email_allowed_domains unless email_allowed_domains.nil?
        request[:email_jit_provisioning] = email_jit_provisioning unless email_jit_provisioning.nil?
        request[:email_invites] = email_invites unless email_invites.nil?
        request[:auth_methods] = auth_methods unless auth_methods.nil?
        request[:allowed_auth_methods] = allowed_auth_methods unless allowed_auth_methods.nil?
        request[:mfa_policy] = mfa_policy unless mfa_policy.nil?
        request[:rbac_email_implicit_role_assignments] = rbac_email_implicit_role_assignments unless rbac_email_implicit_role_assignments.nil?
        request[:mfa_methods] = mfa_methods unless mfa_methods.nil?
        request[:allowed_mfa_methods] = allowed_mfa_methods unless allowed_mfa_methods.nil?

        post_request('/v1/b2b/discovery/organizations/create', request, headers)
      end

      # List all possible organization relationships connected to a [Member Session](https://stytch.com/docs/b2b/api/session-object) or Intermediate Session.
      #
      # When a Member Session is passed in, relationships with a type of `active_member`, `pending_member`, or `invited_member`
      # will be returned, and any membership can be assumed by calling the [Exchange Session](https://stytch.com/docs/b2b/api/exchange-session) endpoint.
      #
      # When an Intermediate Session is passed in, all relationship types - `active_member`, `pending_member`, `invited_member`,
      # and `eligible_to_join_by_email_domain` - will be returned,
      # and any membership can be assumed by calling the [Exchange Intermediate Session](https://stytch.com/docs/b2b/api/exchange-intermediate-session) endpoint.
      #
      # This endpoint requires either an `intermediate_session_token`, `session_jwt` or `session_token` be included in the request.
      # It will return an error if multiple are present.
      #
      # This operation does not consume the Intermediate Session or Session Token passed in.
      #
      # == Parameters:
      # intermediate_session_token::
      #   The Intermediate Session Token. This token does not necessarily belong to a specific instance of a Member, but represents a bag of factors that may be converted to a member session.
      #     The token can be used with the [OTP SMS Authenticate endpoint](https://stytch.com/docs/b2b/api/authenticate-otp-sms) to complete an MFA flow;
      #     the [Exchange Intermediate Session endpoint](https://stytch.com/docs/b2b/api/exchange-intermediate-session) to join a specific Organization that allows the factors represented by the intermediate session token;
      #     or the [Create Organization via Discovery endpoint](https://stytch.com/docs/b2b/api/create-organization-via-discovery) to create a new Organization and Member.
      #   The type of this field is nilable +String+.
      # session_token::
      #   A secret token for a given Stytch Session.
      #   The type of this field is nilable +String+.
      # session_jwt::
      #   The JSON Web Token (JWT) for a given Stytch Session.
      #   The type of this field is nilable +String+.
      #
      # == Returns:
      # An object with the following fields:
      # request_id::
      #   Globally unique UUID that is returned with every API call. This value is important to log for debugging purposes; we may ask for this value to help identify a specific API call when helping you debug an issue.
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
      # organization_id_hint::
      #   If the intermediate session token is associated with a specific Organization, that Organization ID will be returned here. The Organization ID will be null if the intermediate session token was generated by a email magic link discovery or OAuth discovery flow. If a session token or session JWT is provided, the Organization ID hint will be null.
      #   The type of this field is nilable +String+.
      def list(
        intermediate_session_token: nil,
        session_token: nil,
        session_jwt: nil
      )
        headers = {}
        request = {}
        request[:intermediate_session_token] = intermediate_session_token unless intermediate_session_token.nil?
        request[:session_token] = session_token unless session_token.nil?
        request[:session_jwt] = session_jwt unless session_jwt.nil?

        post_request('/v1/b2b/discovery/organizations', request, headers)
      end
    end
  end
end
