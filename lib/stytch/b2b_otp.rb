# frozen_string_literal: true

# !!!
# WARNING: This file is autogenerated
# Only modify code within MANUAL() sections
# or your changes may be overwritten later!
# !!!

require_relative 'request_helper'

module StytchB2B
  class OTPs
    include Stytch::RequestHelper
    attr_reader :sms, :email

    def initialize(connection)
      @connection = connection

      @sms = StytchB2B::OTPs::Sms.new(@connection)
      @email = StytchB2B::OTPs::Email.new(@connection)
    end

    class Sms
      include Stytch::RequestHelper

      def initialize(connection)
        @connection = connection
      end

      # Send a One-Time Passcode (OTP) to a's phone number.
      #
      # If the Member already has a phone number, the `mfa_phone_number` field is not needed; the endpoint will send an OTP to the number associated with the Member.
      # If the Member does not have a phone number, the endpoint will send an OTP to the `mfa_phone_number` provided and link the `mfa_phone_number` with the Member.
      #
      # An error will be thrown if the Member already has a phone number and the provided `mfa_phone_number` does not match the existing one.
      #
      # OTP codes expire after two minutes. Note that sending another OTP code before the first has expired will invalidate the first code.
      #
      # If a Member has a phone number and is enrolled in MFA, then after a successful primary authentication event (e.g. [email magic link](https://stytch.com/docs/b2b/api/authenticate-magic-link) or [SSO](https://stytch.com/docs/b2b/api/sso-authenticate) login is complete), an SMS OTP will automatically be sent to their phone number. In that case, this endpoint should only be used for subsequent authentication events, such as prompting a Member for an OTP again after a period of inactivity.
      #
      # Passing an intermediate session token, session token, or session JWT is not required, but if passed must match the Member ID passed.
      #
      # ### Cost to send SMS OTP
      # Before configuring SMS or WhatsApp OTPs, please review how Stytch [bills the costs of international OTPs](https://stytch.com/pricing) and understand how to protect your app against [toll fraud](https://stytch.com/docs/guides/passcodes/toll-fraud/overview).
      #
      # Even when international SMS is enabled, we do not support sending SMS to countries on our [Unsupported countries list](https://stytch.com/docs/guides/passcodes/unsupported-countries).
      #
      # __Note:__ SMS to phone numbers outside of the US and Canada is disabled by default for customers who did not use SMS prior to October 2023. If you're interested in sending international SMS, please reach out to [support@stytch.com](mailto:support@stytch.com?subject=Enable%20international%20SMS).
      #
      # == Parameters:
      # organization_id::
      #   Globally unique UUID that identifies a specific Organization. The `organization_id` is critical to perform operations on an Organization, so be sure to preserve this value.
      #   The type of this field is +String+.
      # member_id::
      #   Globally unique UUID that identifies a specific Member. The `member_id` is critical to perform operations on a Member, so be sure to preserve this value.
      #   The type of this field is +String+.
      # mfa_phone_number::
      #   The phone number to send the OTP to. If the Member already has a phone number, this argument is not needed.
      #   The type of this field is nilable +String+.
      # locale::
      #   Used to determine which language to use when sending the user this delivery method. Parameter is a [IETF BCP 47 language tag](https://www.w3.org/International/articles/language-tags/), e.g. `"en"`.
      #
      # Currently supported languages are English (`"en"`), Spanish (`"es"`), and Brazilian Portuguese (`"pt-br"`); if no value is provided, the copy defaults to English.
      #
      # Request support for additional languages [here](https://docs.google.com/forms/d/e/1FAIpQLScZSpAu_m2AmLXRT3F3kap-s_mcV6UTBitYn6CdyWP0-o7YjQ/viewform?usp=sf_link")!
      #
      #   The type of this field is nilable +SendRequestLocale+ (string enum).
      # intermediate_session_token::
      #   The Intermediate Session Token. This token does not necessarily belong to a specific instance of a Member, but represents a bag of factors that may be converted to a member session. The token can be used with the [OTP SMS Authenticate endpoint](https://stytch.com/docs/b2b/api/authenticate-otp-sms), [TOTP Authenticate endpoint](https://stytch.com/docs/b2b/api/authenticate-totp), or [Recovery Codes Recover endpoint](https://stytch.com/docs/b2b/api/recovery-codes-recover) to complete an MFA flow and log in to the Organization. It can also be used with the [Exchange Intermediate Session endpoint](https://stytch.com/docs/b2b/api/exchange-intermediate-session) to join a specific Organization that allows the factors represented by the intermediate session token; or the [Create Organization via Discovery endpoint](https://stytch.com/docs/b2b/api/create-organization-via-discovery) to create a new Organization and Member.
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
      def send(
        organization_id:,
        member_id:,
        mfa_phone_number: nil,
        locale: nil,
        intermediate_session_token: nil,
        session_token: nil,
        session_jwt: nil
      )
        headers = {}
        request = {
          organization_id: organization_id,
          member_id: member_id
        }
        request[:mfa_phone_number] = mfa_phone_number unless mfa_phone_number.nil?
        request[:locale] = locale unless locale.nil?
        request[:intermediate_session_token] = intermediate_session_token unless intermediate_session_token.nil?
        request[:session_token] = session_token unless session_token.nil?
        request[:session_jwt] = session_jwt unless session_jwt.nil?

        post_request('/v1/b2b/otps/sms/send', request, headers)
      end

      # SMS OTPs may not be used as a primary authentication mechanism. They can be used to complete an MFA requirement, or they can be used as a step-up factor to be added to an existing session.
      #
      # This endpoint verifies that the one-time passcode (OTP) is valid and hasn't expired or been previously used. OTP codes expire after two minutes.
      #
      # A given Member may only have a single active OTP code at any given time. If a Member requests another OTP code before the first one has expired, the first one will be invalidated.
      #
      # Exactly one of `intermediate_session_token`, `session_token`, or `session_jwt` must be provided in the request.
      # If an intermediate session token is provided, this operation will consume it.
      #
      # Intermediate session tokens are generated upon successful calls to primary authenticate methods in the case where MFA is required,
      # such as [email magic link authenticate](https://stytch.com/docs/b2b/api/authenticate-magic-link),
      # or upon successful calls to discovery authenticate methods, such as [email magic link discovery authenticate](https://stytch.com/docs/b2b/api/authenticate-discovery-magic-link).
      #
      # If the's MFA policy is `REQUIRED_FOR_ALL`, a successful OTP authentication will change the's `mfa_enrolled` status to `true` if it is not already `true`.
      # If the Organization's MFA policy is `OPTIONAL`, the Member's MFA enrollment can be toggled by passing in a value for the `set_mfa_enrollment` field.
      # The Member's MFA enrollment can also be toggled through the [Update Member](https://stytch.com/docs/b2b/api/update-member) endpoint.
      #
      # Provide the `session_duration_minutes` parameter to set the lifetime of the session. If the `session_duration_minutes` parameter is not specified, a Stytch session will be created with a duration of 60 minutes.
      #
      # == Parameters:
      # organization_id::
      #   Globally unique UUID that identifies a specific Organization. The `organization_id` is critical to perform operations on an Organization, so be sure to preserve this value.
      #   The type of this field is +String+.
      # member_id::
      #   Globally unique UUID that identifies a specific Member. The `member_id` is critical to perform operations on a Member, so be sure to preserve this value.
      #   The type of this field is +String+.
      # code::
      #   The code to authenticate.
      #   The type of this field is +String+.
      # intermediate_session_token::
      #   The Intermediate Session Token. This token does not necessarily belong to a specific instance of a Member, but represents a bag of factors that may be converted to a member session. The token can be used with the [OTP SMS Authenticate endpoint](https://stytch.com/docs/b2b/api/authenticate-otp-sms), [TOTP Authenticate endpoint](https://stytch.com/docs/b2b/api/authenticate-totp), or [Recovery Codes Recover endpoint](https://stytch.com/docs/b2b/api/recovery-codes-recover) to complete an MFA flow and log in to the Organization. It can also be used with the [Exchange Intermediate Session endpoint](https://stytch.com/docs/b2b/api/exchange-intermediate-session) to join a specific Organization that allows the factors represented by the intermediate session token; or the [Create Organization via Discovery endpoint](https://stytch.com/docs/b2b/api/create-organization-via-discovery) to create a new Organization and Member.
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
      # set_mfa_enrollment::
      #   Optionally sets the Member’s MFA enrollment status upon a successful authentication. If the Organization’s MFA policy is `REQUIRED_FOR_ALL`, this field will be ignored. If this field is not passed in, the Member’s `mfa_enrolled` boolean will not be affected. The options are:
      #
      #   `enroll` – sets the Member's `mfa_enrolled` boolean to `true`. The Member will be required to complete an MFA step upon subsequent logins to the Organization.
      #
      #   `unenroll` –  sets the Member's `mfa_enrolled` boolean to `false`. The Member will no longer be required to complete MFA steps when logging in to the Organization.
      #
      #   The type of this field is nilable +String+.
      # set_default_mfa::
      #   (no documentation yet)
      #   The type of this field is nilable +Boolean+.
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
      # status_code::
      #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
      #   The type of this field is +Integer+.
      # member_session::
      #   The [Session object](https://stytch.com/docs/b2b/api/session-object).
      #   The type of this field is nilable +MemberSession+ (+object+).
      def authenticate(
        organization_id:,
        member_id:,
        code:,
        intermediate_session_token: nil,
        session_token: nil,
        session_jwt: nil,
        session_duration_minutes: nil,
        session_custom_claims: nil,
        set_mfa_enrollment: nil,
        set_default_mfa: nil
      )
        headers = {}
        request = {
          organization_id: organization_id,
          member_id: member_id,
          code: code
        }
        request[:intermediate_session_token] = intermediate_session_token unless intermediate_session_token.nil?
        request[:session_token] = session_token unless session_token.nil?
        request[:session_jwt] = session_jwt unless session_jwt.nil?
        request[:session_duration_minutes] = session_duration_minutes unless session_duration_minutes.nil?
        request[:session_custom_claims] = session_custom_claims unless session_custom_claims.nil?
        request[:set_mfa_enrollment] = set_mfa_enrollment unless set_mfa_enrollment.nil?
        request[:set_default_mfa] = set_default_mfa unless set_default_mfa.nil?

        post_request('/v1/b2b/otps/sms/authenticate', request, headers)
      end
    end

    class Email
      include Stytch::RequestHelper
      attr_reader :discovery

      def initialize(connection)
        @connection = connection

        @discovery = StytchB2B::OTPs::Email::Discovery.new(@connection)
      end

      # Send either a login or signup email OTP to a Member. A new, pending, or invited Member will receive a signup email OTP. Non-active members will have a pending status until they successfully authenticate. An active Member will receive a login email OTP.
      #
      # The OTP is valid for 10 minutes. Only the most recently sent OTP is valid: when an OTP is sent, all OTPs previously sent to the same email address are invalidated, even if unused or unexpired.
      #
      # == Parameters:
      # organization_id::
      #   Globally unique UUID that identifies a specific Organization. The `organization_id` is critical to perform operations on an Organization, so be sure to preserve this value.
      #   The type of this field is +String+.
      # email_address::
      #   The email address of the Member.
      #   The type of this field is +String+.
      # login_template_id::
      #   Use a custom template for login emails. By default, it will use your default email template. The template must be a template using our built-in customizations or a custom HTML email for OTP - Login.
      #   The type of this field is nilable +String+.
      # signup_template_id::
      #   Use a custom template for signup emails. By default, it will use your default email template. The template must be a template using our built-in customizations or a custom HTML email for OTP - Signup.
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
        login_template_id: nil,
        signup_template_id: nil,
        locale: nil
      )
        headers = {}
        request = {
          organization_id: organization_id,
          email_address: email_address
        }
        request[:login_template_id] = login_template_id unless login_template_id.nil?
        request[:signup_template_id] = signup_template_id unless signup_template_id.nil?
        request[:locale] = locale unless locale.nil?

        post_request('/v1/b2b/otps/email/login_or_signup', request, headers)
      end

      # Authenticate a with a one-time passcode (OTP). This endpoint requires an OTP that is not expired or previously used.
      # OTPs have a default expiry of 10 minutes. If the Member’s status is `pending` or `invited`, they will be updated to `active`.
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
      # organization_id::
      #   Globally unique UUID that identifies a specific Organization. The `organization_id` is critical to perform operations on an Organization, so be sure to preserve this value.
      #   The type of this field is +String+.
      # email_address::
      #   The email address of the Member.
      #   The type of this field is +String+.
      # code::
      #   The code to authenticate.
      #   The type of this field is +String+.
      # session_token::
      #   A secret token for a given Stytch Session.
      #   The type of this field is nilable +String+.
      # session_jwt::
      #   The JSON Web Token (JWT) for a given Stytch Session.
      #   The type of this field is nilable +String+.
      # intermediate_session_token::
      #   The Intermediate Session Token. This token does not necessarily belong to a specific instance of a Member, but represents a bag of factors that may be converted to a member session. The token can be used with the [OTP SMS Authenticate endpoint](https://stytch.com/docs/b2b/api/authenticate-otp-sms), [TOTP Authenticate endpoint](https://stytch.com/docs/b2b/api/authenticate-totp), or [Recovery Codes Recover endpoint](https://stytch.com/docs/b2b/api/recovery-codes-recover) to complete an MFA flow and log in to the Organization. It can also be used with the [Exchange Intermediate Session endpoint](https://stytch.com/docs/b2b/api/exchange-intermediate-session) to join a specific Organization that allows the factors represented by the intermediate session token; or the [Create Organization via Discovery endpoint](https://stytch.com/docs/b2b/api/create-organization-via-discovery) to create a new Organization and Member.
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
      #   Used to determine which language to use when sending the user this delivery method. Parameter is a [IETF BCP 47 language tag](https://www.w3.org/International/articles/language-tags/), e.g. `"en"`.
      #
      # Currently supported languages are English (`"en"`), Spanish (`"es"`), and Brazilian Portuguese (`"pt-br"`); if no value is provided, the copy defaults to English.
      #
      # Request support for additional languages [here](https://docs.google.com/forms/d/e/1FAIpQLScZSpAu_m2AmLXRT3F3kap-s_mcV6UTBitYn6CdyWP0-o7YjQ/viewform?usp=sf_link")!
      #
      #   The type of this field is nilable +AuthenticateRequestLocale+ (string enum).
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
      # member_session::
      #   The [Session object](https://stytch.com/docs/b2b/api/session-object).
      #   The type of this field is +MemberSession+ (+object+).
      # organization::
      #   The [Organization object](https://stytch.com/docs/b2b/api/organization-object).
      #   The type of this field is +Organization+ (+object+).
      # intermediate_session_token::
      #   The Intermediate Session Token. This token does not necessarily belong to a specific instance of a Member, but represents a bag of factors that may be converted to a member session. The token can be used with the [OTP SMS Authenticate endpoint](https://stytch.com/docs/b2b/api/authenticate-otp-sms), [TOTP Authenticate endpoint](https://stytch.com/docs/b2b/api/authenticate-totp), or [Recovery Codes Recover endpoint](https://stytch.com/docs/b2b/api/recovery-codes-recover) to complete an MFA flow and log in to the Organization. It can also be used with the [Exchange Intermediate Session endpoint](https://stytch.com/docs/b2b/api/exchange-intermediate-session) to join a specific Organization that allows the factors represented by the intermediate session token; or the [Create Organization via Discovery endpoint](https://stytch.com/docs/b2b/api/create-organization-via-discovery) to create a new Organization and Member.
      #   The type of this field is +String+.
      # member_authenticated::
      #   Indicates whether the Member is fully authenticated. If false, the Member needs to complete an MFA step to log in to the Organization.
      #   The type of this field is +Boolean+.
      # status_code::
      #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
      #   The type of this field is +Integer+.
      # mfa_required::
      #   Information about the MFA requirements of the Organization and the Member's options for fulfilling MFA.
      #   The type of this field is nilable +MfaRequired+ (+object+).
      def authenticate(
        organization_id:,
        email_address:,
        code:,
        session_token: nil,
        session_jwt: nil,
        intermediate_session_token: nil,
        session_duration_minutes: nil,
        session_custom_claims: nil,
        locale: nil
      )
        headers = {}
        request = {
          organization_id: organization_id,
          email_address: email_address,
          code: code
        }
        request[:session_token] = session_token unless session_token.nil?
        request[:session_jwt] = session_jwt unless session_jwt.nil?
        request[:intermediate_session_token] = intermediate_session_token unless intermediate_session_token.nil?
        request[:session_duration_minutes] = session_duration_minutes unless session_duration_minutes.nil?
        request[:session_custom_claims] = session_custom_claims unless session_custom_claims.nil?
        request[:locale] = locale unless locale.nil?

        post_request('/v1/b2b/otps/email/authenticate', request, headers)
      end

      class Discovery
        include Stytch::RequestHelper

        def initialize(connection)
          @connection = connection
        end

        # Send a discovery OTP to an email address. The OTP is valid for 10 minutes. Only the most recently sent OTP is valid: when an OTP is sent, all OTPs previously sent to the same email address are invalidated, even if unused or unexpired.
        #
        # == Parameters:
        # email_address::
        #   The email address to start the discovery flow for.
        #   The type of this field is +String+.
        # login_template_id::
        #   Use a custom template for login emails. By default, it will use your default email template. The template must be a template using our built-in customizations or a custom HTML email for OTP - Login.
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
          login_template_id: nil,
          locale: nil
        )
          headers = {}
          request = {
            email_address: email_address
          }
          request[:login_template_id] = login_template_id unless login_template_id.nil?
          request[:locale] = locale unless locale.nil?

          post_request('/v1/b2b/otps/email/discovery/send', request, headers)
        end

        # Authenticates the OTP and returns an intermediate session token. Intermediate session tokens can be used for various Discovery login flows and are valid for 10 minutes.
        #
        # == Parameters:
        # email_address::
        #   The email address of the Member.
        #   The type of this field is +String+.
        # code::
        #   The code to authenticate.
        #   The type of this field is +String+.
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
          email_address:,
          code:
        )
          headers = {}
          request = {
            email_address: email_address,
            code: code
          }

          post_request('/v1/b2b/otps/email/discovery/authenticate', request, headers)
        end
      end
    end
  end
end
