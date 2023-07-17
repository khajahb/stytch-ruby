# frozen_string_literal: true

# !!!
# WARNING: This file is autogenerated
# Only modify code within MANUAL() sections
# or your changes may be overwritten later!
# !!!

require_relative 'request_helper'

module Stytch
  class MagicLinks
    include Stytch::RequestHelper
    attr_reader :email

    def initialize(connection)
      @connection = connection

      @email = Stytch::MagicLinks::Email.new(@connection)
    end

    # Authenticate a User given a Magic Link. This endpoint verifies that the Magic Link token is valid, hasn't expired or been previously used, and any optional security settings such as IP match or user agent match are satisfied.
    #
    # == Parameters:
    # token::
    #   The token to authenticate.
    #   The type of this field is +String+.
    # attributes::
    #   Provided attributes help with fraud detection.
    #   The type of this field is nilable +Attributes+ (+object+).
    # options::
    #   Specify optional security settings.
    #   The type of this field is nilable +Options+ (+object+).
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
    # method_id::
    #   The `email_id` or `phone_id` involved in the given authentication.
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
    # reset_sessions::
    #   Indicates if all other of the User's Sessions need to be reset. You should check this field if you aren't using Stytch's Session product. If you are using Stytch's Session product, we revoke the User's other sessions for you.
    #   The type of this field is +Boolean+.
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
      token:,
      attributes: nil,
      options: nil,
      session_token: nil,
      session_duration_minutes: nil,
      session_jwt: nil,
      session_custom_claims: nil,
      code_verifier: nil
    )
      request = {
        token: token
      }
      request[:attributes] = attributes unless attributes.nil?
      request[:options] = options unless options.nil?
      request[:session_token] = session_token unless session_token.nil?
      request[:session_duration_minutes] = session_duration_minutes unless session_duration_minutes.nil?
      request[:session_jwt] = session_jwt unless session_jwt.nil?
      request[:session_custom_claims] = session_custom_claims unless session_custom_claims.nil?
      request[:code_verifier] = code_verifier unless code_verifier.nil?

      post_request('/v1/magic_links/authenticate', request)
    end

    # Create an embeddable Magic Link token for a User. Access to this endpoint is restricted. To enable it, please send us a note at support@stytch.com.
    #
    # ### Next steps
    # Send the returned `token` value to the end user in a link which directs to your application. When the end user follows your link, collect the token, and call [Authenticate Magic Link](https://stytch.com/docs/api/authenticate-magic-link) to complete authentication.
    #
    # == Parameters:
    # user_id::
    #   The unique ID of a specific User.
    #   The type of this field is +String+.
    # expiration_minutes::
    #   Set the expiration for the Magic Link `token` in minutes. By default, it expires in 1 hour. The minimum expiration is 5 minutes and the maximum is 7 days (10080 mins).
    #   The type of this field is nilable +Integer+.
    # attributes::
    #   Provided attributes help with fraud detection.
    #   The type of this field is nilable +Attributes+ (+object+).
    #
    # == Returns:
    # An object with the following fields:
    # request_id::
    #   Globally unique UUID that is returned with every API call. This value is important to log for debugging purposes; we may ask for this value to help identify a specific API call when helping you debug an issue.
    #   The type of this field is +String+.
    # user_id::
    #   The unique ID of the affected User.
    #   The type of this field is +String+.
    # token::
    #   The Magic Link `token` that you'll include in your contact method of choice, e.g. email or SMS.
    #   The type of this field is +String+.
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    def create(
      user_id:,
      expiration_minutes: nil,
      attributes: nil
    )
      request = {
        user_id: user_id
      }
      request[:expiration_minutes] = expiration_minutes unless expiration_minutes.nil?
      request[:attributes] = attributes unless attributes.nil?

      post_request('/v1/magic_links', request)
    end

    class Email
      include Stytch::RequestHelper

      def initialize(connection)
        @connection = connection
      end

      # Send a magic link to an existing Stytch user using their email address. If you'd like to create a user and send them a magic link by email with one request, use our [log in or create endpoint](https://stytch.com/docs/api/log-in-or-create-user-by-email).
      #
      # ### Add an email to an existing user
      # This endpoint also allows you to add a new email to an existing Stytch User. Including a `user_id`, `session_token`, or `session_jwt` in the request will add the email to the pre-existing Stytch User upon successful authentication.
      #
      # Adding a new email to an existing Stytch User requires the user to be present and validate the email via magic link. This requirement is in place to prevent account takeover attacks.
      #
      # ### Next steps
      # The user is emailed a magic link which redirects them to the provided [redirect URL](https://stytch.com/docs/magic-links#email-magic-links_redirect-routing). Collect the `token` from the URL query parameters, and call [Authenticate magic link](https://stytch.com/docs/api/authenticate-magic-link) to complete authentication.
      #
      # == Parameters:
      # email::
      #   The email address of the User to send the Magic Link to.
      #   The type of this field is +String+.
      # login_template_id::
      #   Use a custom template for login emails. By default, it will use your default email template. The template must be a template using our built-in customizations or a custom HTML email for Magic links - Login.
      #   The type of this field is nilable +String+.
      # attributes::
      #   Provided attributes help with fraud detection.
      #   The type of this field is nilable +Attributes+ (+object+).
      # login_magic_link_url::
      #   The URL the end user clicks from the login Email Magic Link. This should be a URL that your app receives and parses and subsequently send an API request to authenticate the Magic Link and log in the User. If this value is not passed, the default login redirect URL that you set in your Dashboard is used. If you have not set a default login redirect URL, an error is returned.
      #   The type of this field is nilable +String+.
      # signup_magic_link_url::
      #   The URL the end user clicks from the sign-up Email Magic Link. This should be a URL that your app receives and parses and subsequently send an API request to authenticate the Magic Link and sign-up the User. If this value is not passed, the default sign-up redirect URL that you set in your Dashboard is used. If you have not set a default sign-up redirect URL, an error is returned.
      #   The type of this field is nilable +String+.
      # login_expiration_minutes::
      #   Set the expiration for the login email magic link, in minutes. By default, it expires in 1 hour. The minimum expiration is 5 minutes and the maximum is 7 days (10080 mins).
      #   The type of this field is nilable +Integer+.
      # signup_expiration_minutes::
      #   Set the expiration for the sign-up email magic link, in minutes. By default, it expires in 1 week. The minimum expiration is 5 minutes and the maximum is 7 days (10080 mins).
      #   The type of this field is nilable +Integer+.
      # code_challenge::
      #   A base64url encoded SHA256 hash of a one time secret used to validate that the request starts and ends on the same device.
      #   The type of this field is nilable +String+.
      # user_id::
      #   The unique ID of a specific User.
      #   The type of this field is nilable +String+.
      # session_token::
      #   The `session_token` of the user to associate the email with.
      #   The type of this field is nilable +String+.
      # session_jwt::
      #   The `session_jwt` of the user to associate the email with.
      #   The type of this field is nilable +String+.
      # locale::
      #   Used to determine which language to use when sending the user this delivery method. Parameter is a [IETF BCP 47 language tag](https://www.w3.org/International/articles/language-tags/), e.g. `"en"`.
      #
      # Currently supported languages are English (`"en"`), Spanish (`"es"`), and Brazilian Portuguese (`"pt-br"`); if no value is provided, the copy defaults to English.
      #
      # Request support for additional languages [here](https://docs.google.com/forms/d/e/1FAIpQLScZSpAu_m2AmLXRT3F3kap-s_mcV6UTBitYn6CdyWP0-o7YjQ/viewform?usp=sf_link")!
      #
      #   The type of this field is nilable +SendRequestLocale+ (+object+).
      # signup_template_id::
      #   Use a custom template for sign-up emails. By default, it will use your default email template. The template must be a template using our built-in customizations or a custom HTML email for Magic links - Sign-up.
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
      # email_id::
      #   The unique ID of a specific email address.
      #   The type of this field is +String+.
      # status_code::
      #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
      #   The type of this field is +Integer+.
      def send(
        email:,
        login_template_id: nil,
        attributes: nil,
        login_magic_link_url: nil,
        signup_magic_link_url: nil,
        login_expiration_minutes: nil,
        signup_expiration_minutes: nil,
        code_challenge: nil,
        user_id: nil,
        session_token: nil,
        session_jwt: nil,
        locale: nil,
        signup_template_id: nil
      )
        request = {
          email: email
        }
        request[:login_template_id] = login_template_id unless login_template_id.nil?
        request[:attributes] = attributes unless attributes.nil?
        request[:login_magic_link_url] = login_magic_link_url unless login_magic_link_url.nil?
        request[:signup_magic_link_url] = signup_magic_link_url unless signup_magic_link_url.nil?
        request[:login_expiration_minutes] = login_expiration_minutes unless login_expiration_minutes.nil?
        request[:signup_expiration_minutes] = signup_expiration_minutes unless signup_expiration_minutes.nil?
        request[:code_challenge] = code_challenge unless code_challenge.nil?
        request[:user_id] = user_id unless user_id.nil?
        request[:session_token] = session_token unless session_token.nil?
        request[:session_jwt] = session_jwt unless session_jwt.nil?
        request[:locale] = locale unless locale.nil?
        request[:signup_template_id] = signup_template_id unless signup_template_id.nil?

        post_request('/v1/magic_links/email/send', request)
      end

      # Send either a login or signup Magic Link to the User based on if the email is associated with a User already. A new or pending User will receive a signup Magic Link. An active User will receive a login Magic Link. For more information on how to control the status your Users are created in see the `create_user_as_pending` flag.
      #
      # ### Next steps
      # The User is emailed a Magic Link which redirects them to the provided [redirect URL](https://stytch.com/docs/magic-links#email-magic-links_redirect-routing). Collect the `token` from the URL query parameters and call [Authenticate Magic Link](https://stytch.com/docs/api/authenticate-magic-link) to complete authentication.
      #
      # == Parameters:
      # email::
      #   The email address of the end user.
      #   The type of this field is +String+.
      # login_magic_link_url::
      #   The URL the end user clicks from the login Email Magic Link. This should be a URL that your app receives and parses and subsequently send an API request to authenticate the Magic Link and log in the User. If this value is not passed, the default login redirect URL that you set in your Dashboard is used. If you have not set a default login redirect URL, an error is returned.
      #   The type of this field is nilable +String+.
      # signup_magic_link_url::
      #   The URL the end user clicks from the sign-up Email Magic Link. This should be a URL that your app receives and parses and subsequently send an API request to authenticate the Magic Link and sign-up the User. If this value is not passed, the default sign-up redirect URL that you set in your Dashboard is used. If you have not set a default sign-up redirect URL, an error is returned.
      #   The type of this field is nilable +String+.
      # login_expiration_minutes::
      #   Set the expiration for the login email magic link, in minutes. By default, it expires in 1 hour. The minimum expiration is 5 minutes and the maximum is 7 days (10080 mins).
      #   The type of this field is nilable +Integer+.
      # signup_expiration_minutes::
      #   Set the expiration for the sign-up email magic link, in minutes. By default, it expires in 1 week. The minimum expiration is 5 minutes and the maximum is 7 days (10080 mins).
      #   The type of this field is nilable +Integer+.
      # login_template_id::
      #   Use a custom template for login emails. By default, it will use your default email template. The template must be a template using our built-in customizations or a custom HTML email for Magic links - Login.
      #   The type of this field is nilable +String+.
      # signup_template_id::
      #   Use a custom template for sign-up emails. By default, it will use your default email template. The template must be a template using our built-in customizations or a custom HTML email for Magic links - Sign-up.
      #   The type of this field is nilable +String+.
      # attributes::
      #   Provided attributes help with fraud detection.
      #   The type of this field is nilable +Attributes+ (+object+).
      # create_user_as_pending::
      #   Flag for whether or not to save a user as pending vs active in Stytch. Defaults to false.
      #         If true, users will be saved with status pending in Stytch's backend until authenticated.
      #         If false, users will be created as active. An example usage of
      #         a true flag would be to require users to verify their phone by entering the OTP code before creating
      #         an account for them.
      #   The type of this field is nilable +Boolean+.
      # code_challenge::
      #   A base64url encoded SHA256 hash of a one time secret used to validate that the request starts and ends on the same device.
      #   The type of this field is nilable +String+.
      # locale::
      #   Used to determine which language to use when sending the user this delivery method. Parameter is a [IETF BCP 47 language tag](https://www.w3.org/International/articles/language-tags/), e.g. `"en"`.
      #
      # Currently supported languages are English (`"en"`), Spanish (`"es"`), and Brazilian Portuguese (`"pt-br"`); if no value is provided, the copy defaults to English.
      #
      # Request support for additional languages [here](https://docs.google.com/forms/d/e/1FAIpQLScZSpAu_m2AmLXRT3F3kap-s_mcV6UTBitYn6CdyWP0-o7YjQ/viewform?usp=sf_link")!
      #
      #   The type of this field is nilable +LoginOrCreateRequestLocale+ (+object+).
      #
      # == Returns:
      # An object with the following fields:
      # request_id::
      #   Globally unique UUID that is returned with every API call. This value is important to log for debugging purposes; we may ask for this value to help identify a specific API call when helping you debug an issue.
      #   The type of this field is +String+.
      # user_id::
      #   The unique ID of the affected User.
      #   The type of this field is +String+.
      # email_id::
      #   The unique ID of a specific email address.
      #   The type of this field is +String+.
      # user_created::
      #   In `login_or_create` endpoints, this field indicates whether or not a User was just created.
      #   The type of this field is +Boolean+.
      # status_code::
      #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
      #   The type of this field is +Integer+.
      def login_or_create(
        email:,
        login_magic_link_url: nil,
        signup_magic_link_url: nil,
        login_expiration_minutes: nil,
        signup_expiration_minutes: nil,
        login_template_id: nil,
        signup_template_id: nil,
        attributes: nil,
        create_user_as_pending: nil,
        code_challenge: nil,
        locale: nil
      )
        request = {
          email: email
        }
        request[:login_magic_link_url] = login_magic_link_url unless login_magic_link_url.nil?
        request[:signup_magic_link_url] = signup_magic_link_url unless signup_magic_link_url.nil?
        request[:login_expiration_minutes] = login_expiration_minutes unless login_expiration_minutes.nil?
        request[:signup_expiration_minutes] = signup_expiration_minutes unless signup_expiration_minutes.nil?
        request[:login_template_id] = login_template_id unless login_template_id.nil?
        request[:signup_template_id] = signup_template_id unless signup_template_id.nil?
        request[:attributes] = attributes unless attributes.nil?
        request[:create_user_as_pending] = create_user_as_pending unless create_user_as_pending.nil?
        request[:code_challenge] = code_challenge unless code_challenge.nil?
        request[:locale] = locale unless locale.nil?

        post_request('/v1/magic_links/email/login_or_create', request)
      end

      # Create a User and send an invite Magic Link to the provided `email`. The User will be created with a `pending` status until they click the Magic Link in the invite email.
      #
      # ### Next steps
      # The User is emailed a Magic Link which redirects them to the provided [redirect URL](https://stytch.com/docs/magic-links#email-magic-links_redirect-routing). Collect the `token` from the URL query parameters and call [Authenticate Magic Link](https://stytch.com/docs/api/authenticate-magic-link) to complete authentication.
      #
      # == Parameters:
      # email::
      #   The email address of the User to send the invite Magic Link to.
      #   The type of this field is +String+.
      # invite_template_id::
      #   Use a custom template for invite emails. By default, it will use your default email template. The template must be a template using our built-in customizations or a custom HTML email for Magic links - Invite.
      #   The type of this field is nilable +String+.
      # attributes::
      #   Provided attributes help with fraud detection.
      #   The type of this field is nilable +Attributes+ (+object+).
      # name::
      #   The name of the user. Each field in the name object is optional.
      #   The type of this field is nilable +Name+ (+object+).
      # invite_magic_link_url::
      #   The URL the end user clicks from the Email Magic Link. This should be a URL that your app receives and parses and subsequently sends an API request to authenticate the Magic Link and log in the User. If this value is not passed, the default invite redirect URL that you set in your Dashboard is used. If you have not set a default sign-up redirect URL, an error is returned.
      #   The type of this field is nilable +String+.
      # invite_expiration_minutes::
      #   Set the expiration for the email magic link, in minutes. By default, it expires in 1 hour. The minimum expiration is 5 minutes and the maximum is 7 days (10080 mins).
      #   The type of this field is nilable +Integer+.
      # locale::
      #   Used to determine which language to use when sending the user this delivery method. Parameter is a [IETF BCP 47 language tag](https://www.w3.org/International/articles/language-tags/), e.g. `"en"`.
      #
      # Currently supported languages are English (`"en"`), Spanish (`"es"`), and Brazilian Portuguese (`"pt-br"`); if no value is provided, the copy defaults to English.
      #
      # Request support for additional languages [here](https://docs.google.com/forms/d/e/1FAIpQLScZSpAu_m2AmLXRT3F3kap-s_mcV6UTBitYn6CdyWP0-o7YjQ/viewform?usp=sf_link")!
      #
      #   The type of this field is nilable +InviteRequestLocale+ (+object+).
      #
      # == Returns:
      # An object with the following fields:
      # request_id::
      #   Globally unique UUID that is returned with every API call. This value is important to log for debugging purposes; we may ask for this value to help identify a specific API call when helping you debug an issue.
      #   The type of this field is +String+.
      # user_id::
      #   The unique ID of the affected User.
      #   The type of this field is +String+.
      # email_id::
      #   The unique ID of a specific email address.
      #   The type of this field is +String+.
      # status_code::
      #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
      #   The type of this field is +Integer+.
      def invite(
        email:,
        invite_template_id: nil,
        attributes: nil,
        name: nil,
        invite_magic_link_url: nil,
        invite_expiration_minutes: nil,
        locale: nil
      )
        request = {
          email: email
        }
        request[:invite_template_id] = invite_template_id unless invite_template_id.nil?
        request[:attributes] = attributes unless attributes.nil?
        request[:name] = name unless name.nil?
        request[:invite_magic_link_url] = invite_magic_link_url unless invite_magic_link_url.nil?
        request[:invite_expiration_minutes] = invite_expiration_minutes unless invite_expiration_minutes.nil?
        request[:locale] = locale unless locale.nil?

        post_request('/v1/magic_links/email/invite', request)
      end

      # Revoke a pending invite based on the `email` provided.
      #
      # == Parameters:
      # email::
      #   The email of the user.
      #   The type of this field is +String+.
      #
      # == Returns:
      # An object with the following fields:
      # request_id::
      #   Globally unique UUID that is returned with every API call. This value is important to log for debugging purposes; we may ask for this value to help identify a specific API call when helping you debug an issue.
      #   The type of this field is +String+.
      # status_code::
      #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
      #   The type of this field is +Integer+.
      def revoke_invite(
        email:
      )
        request = {
          email: email
        }

        post_request('/v1/magic_links/email/revoke_invite', request)
      end
    end
  end
end
