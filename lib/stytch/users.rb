# frozen_string_literal: true

# !!!
# WARNING: This file is autogenerated
# Only modify code within MANUAL() sections
# or your changes may be overwritten later!
# !!!

require_relative 'request_helper'

module Stytch
  class Users
    include Stytch::RequestHelper

    def initialize(connection)
      @connection = connection
    end

    # Add a User to Stytch. A `user_id` is returned in the response that can then be used to perform other operations within Stytch. An `email` or a `phone_number` is required.
    #
    # == Parameters:
    # email::
    #   The email address of the end user.
    #   The type of this field is nilable +String+.
    # name::
    #   The name of the user. Each field in the name object is optional.
    #   The type of this field is nilable +Name+ (+object+).
    # attributes::
    #   Provided attributes help with fraud detection.
    #   The type of this field is nilable +Attributes+ (+object+).
    # phone_number::
    #   The phone number to use for one-time passcodes. The phone number should be in E.164 format (i.e. +1XXXXXXXXXX). You may use +10000000000 to test this endpoint, see [Testing](https://stytch.com/docs/home#resources_testing) for more detail.
    #   The type of this field is nilable +String+.
    # create_user_as_pending::
    #   Flag for whether or not to save a user as pending vs active in Stytch. Defaults to false.
    #         If true, users will be saved with status pending in Stytch's backend until authenticated.
    #         If false, users will be created as active. An example usage of
    #         a true flag would be to require users to verify their phone by entering the OTP code before creating
    #         an account for them.
    #   The type of this field is nilable +Boolean+.
    # trusted_metadata::
    #   The `trusted_metadata` field contains an arbitrary JSON object of application-specific data. See the [Metadata](https://stytch.com/docs/api/metadata) reference for complete field behavior details.
    #   The type of this field is nilable +object+.
    # untrusted_metadata::
    #   The `untrusted_metadata` field contains an arbitrary JSON object of application-specific data. Untrusted metadata can be edited by end users directly via the SDK, and **cannot be used to store critical information.** See the [Metadata](https://stytch.com/docs/api/metadata) reference for complete field behavior details.
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
    # email_id::
    #   The unique ID of a specific email address.
    #   The type of this field is +String+.
    # status::
    #   The status of the User. The possible values are `pending` and `active`.
    #   The type of this field is +String+.
    # phone_id::
    #   The unique ID for the phone number.
    #   The type of this field is +String+.
    # user::
    #   The `user` object affected by this API call. See the [Get user endpoint](https://stytch.com/docs/api/get-user) for complete response field details.
    #   The type of this field is +User+ (+object+).
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    def create(
      email: nil,
      name: nil,
      attributes: nil,
      phone_number: nil,
      create_user_as_pending: nil,
      trusted_metadata: nil,
      untrusted_metadata: nil
    )
      headers = {}
      request = {}
      request[:email] = email unless email.nil?
      request[:name] = name unless name.nil?
      request[:attributes] = attributes unless attributes.nil?
      request[:phone_number] = phone_number unless phone_number.nil?
      request[:create_user_as_pending] = create_user_as_pending unless create_user_as_pending.nil?
      request[:trusted_metadata] = trusted_metadata unless trusted_metadata.nil?
      request[:untrusted_metadata] = untrusted_metadata unless untrusted_metadata.nil?

      post_request('/v1/users', request, headers)
    end

    # Get information about a specific User.
    #
    # == Parameters:
    # user_id::
    #   The unique ID of a specific User.
    #   The type of this field is +String+.
    #
    # == Returns:
    # An object with the following fields:
    # request_id::
    #   Globally unique UUID that is returned with every API call. This value is important to log for debugging purposes; we may ask for this value to help identify a specific API call when helping you debug an issue.
    #   The type of this field is +String+.
    # user_id::
    #   The unique ID of the returned User.
    #   The type of this field is +String+.
    # emails::
    #   An array of email objects for the User.
    #   The type of this field is list of +Email+ (+object+).
    # status::
    #   The status of the User. The possible values are `pending` and `active`.
    #   The type of this field is +String+.
    # phone_numbers::
    #   An array of phone number objects linked to the User.
    #   The type of this field is list of +PhoneNumber+ (+object+).
    # webauthn_registrations::
    #   An array that contains a list of all Passkey or WebAuthn registrations for a given User in the Stytch API.
    #   The type of this field is list of +WebAuthnRegistration+ (+object+).
    # providers::
    #   An array of OAuth `provider` objects linked to the User.
    #   The type of this field is list of +OAuthProvider+ (+object+).
    # totps::
    #   An array containing a list of all TOTP instances for a given User in the Stytch API.
    #   The type of this field is list of +TOTP+ (+object+).
    # crypto_wallets::
    #   An array contains a list of all crypto wallets for a given User in the Stytch API.
    #   The type of this field is list of +CryptoWallet+ (+object+).
    # biometric_registrations::
    #   An array that contains a list of all biometric registrations for a given User in the Stytch API.
    #   The type of this field is list of +BiometricRegistration+ (+object+).
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    # name::
    #   The name of the User. Each field in the `name` object is optional.
    #   The type of this field is nilable +Name+ (+object+).
    # created_at::
    #   The timestamp of the User's creation. Values conform to the RFC 3339 standard and are expressed in UTC, e.g. `2021-12-29T12:33:09Z`.
    #   The type of this field is nilable +String+.
    # password::
    #   The password object is returned for users with a password.
    #   The type of this field is nilable +Password+ (+object+).
    # trusted_metadata::
    #   The `trusted_metadata` field contains an arbitrary JSON object of application-specific data. See the [Metadata](https://stytch.com/docs/api/metadata) reference for complete field behavior details.
    #   The type of this field is nilable +object+.
    # untrusted_metadata::
    #   The `untrusted_metadata` field contains an arbitrary JSON object of application-specific data. Untrusted metadata can be edited by end users directly via the SDK, and **cannot be used to store critical information.** See the [Metadata](https://stytch.com/docs/api/metadata) reference for complete field behavior details.
    #   The type of this field is nilable +object+.
    def get(
      user_id:
    )
      headers = {}
      query_params = {}
      request = request_with_query_params("/v1/users/#{user_id}", query_params)
      get_request(request, headers)
    end

    # Search for Users within your Stytch Project. Submit an empty `query` in the request to return all Users.
    #
    # == Parameters:
    # cursor::
    #   The `cursor` field allows you to paginate through your results. Each result array is limited to 1000 results. If your query returns more than 1000 results, you will need to paginate the responses using the `cursor`. If you receive a response that includes a non-null `next_cursor` in the `results_metadata` object, repeat the search call with the `next_cursor` value set to the `cursor` field to retrieve the next page of results. Continue to make search calls until the `next_cursor` in the response is null.
    #   The type of this field is nilable +String+.
    # limit::
    #   The number of search results to return per page. The default limit is 100. A maximum of 1000 results can be returned by a single search request. If the total size of your result set is greater than one page size, you must paginate the response. See the `cursor` field.
    #   The type of this field is nilable +Integer+.
    # query::
    #   The optional query object contains the operator, i.e. `AND` or `OR`, and the operands that will filter your results. Only an operator is required. If you include no operands, no filtering will be applied. If you include no query object, it will return all results with no filtering applied.
    #   The type of this field is nilable +SearchUsersQuery+ (+object+).
    #
    # == Returns:
    # An object with the following fields:
    # request_id::
    #   Globally unique UUID that is returned with every API call. This value is important to log for debugging purposes; we may ask for this value to help identify a specific API call when helping you debug an issue.
    #   The type of this field is +String+.
    # results::
    #   An array of results that match your search query.
    #   The type of this field is list of +User+ (+object+).
    # results_metadata::
    #   The search `results_metadata` object contains metadata relevant to your specific query like total and `next_cursor`.
    #   The type of this field is +ResultsMetadata+ (+object+).
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    def search(
      cursor: nil,
      limit: nil,
      query: nil
    )
      headers = {}
      request = {}
      request[:cursor] = cursor unless cursor.nil?
      request[:limit] = limit unless limit.nil?
      request[:query] = query unless query.nil?

      post_request('/v1/users/search', request, headers)
    end

    # Update a User's attributes.
    #
    # **Note:** In order to add a new email address or phone number to an existing User object, pass the new email address or phone number into the respective `/send` endpoint for the authentication method of your choice. If you specify the existing User's `user_id` while calling the `/send` endpoint, the new, unverified email address or phone number will be added to the existing User object. If the user successfully authenticates within 5 minutes of the `/send` request, the new email address or phone number will be marked as verified and remain permanently on the existing Stytch User. Otherwise, it will be removed from the User object, and any subsequent login requests using that phone number will create a new User. We require this process to guard against an account takeover vulnerability.
    #
    # == Parameters:
    # user_id::
    #   The unique ID of a specific User.
    #   The type of this field is +String+.
    # name::
    #   The name of the user. Each field in the name object is optional.
    #   The type of this field is nilable +Name+ (+object+).
    # attributes::
    #   Provided attributes help with fraud detection.
    #   The type of this field is nilable +Attributes+ (+object+).
    # trusted_metadata::
    #   The `trusted_metadata` field contains an arbitrary JSON object of application-specific data. See the [Metadata](https://stytch.com/docs/api/metadata) reference for complete field behavior details.
    #   The type of this field is nilable +object+.
    # untrusted_metadata::
    #   The `untrusted_metadata` field contains an arbitrary JSON object of application-specific data. Untrusted metadata can be edited by end users directly via the SDK, and **cannot be used to store critical information.** See the [Metadata](https://stytch.com/docs/api/metadata) reference for complete field behavior details.
    #   The type of this field is nilable +object+.
    #
    # == Returns:
    # An object with the following fields:
    # request_id::
    #   Globally unique UUID that is returned with every API call. This value is important to log for debugging purposes; we may ask for this value to help identify a specific API call when helping you debug an issue.
    #   The type of this field is +String+.
    # user_id::
    #   The unique ID of the updated User.
    #   The type of this field is +String+.
    # emails::
    #   An array of email objects for the User.
    #   The type of this field is list of +Email+ (+object+).
    # phone_numbers::
    #   An array of phone number objects linked to the User.
    #   The type of this field is list of +PhoneNumber+ (+object+).
    # crypto_wallets::
    #   An array contains a list of all crypto wallets for a given User in the Stytch API.
    #   The type of this field is list of +CryptoWallet+ (+object+).
    # user::
    #   The `user` object affected by this API call. See the [Get user endpoint](https://stytch.com/docs/api/get-user) for complete response field details.
    #   The type of this field is +User+ (+object+).
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    def update(
      user_id:,
      name: nil,
      attributes: nil,
      trusted_metadata: nil,
      untrusted_metadata: nil
    )
      headers = {}
      request = {}
      request[:name] = name unless name.nil?
      request[:attributes] = attributes unless attributes.nil?
      request[:trusted_metadata] = trusted_metadata unless trusted_metadata.nil?
      request[:untrusted_metadata] = untrusted_metadata unless untrusted_metadata.nil?

      put_request("/v1/users/#{user_id}", request, headers)
    end

    # Exchange a user's email address or phone number for another.
    #
    # Must pass either an `email_address` or a `phone_number`.
    #
    # This endpoint only works if the user has exactly one factor. You are able to exchange the type of factor for another as well, i.e. exchange an `email_address` for a `phone_number`.
    #
    # Use this endpoint with caution as it performs an admin level action.
    #
    # == Parameters:
    # user_id::
    #   The unique ID of a specific User.
    #   The type of this field is +String+.
    # email_address::
    #   The email address to exchange to.
    #   The type of this field is nilable +String+.
    # phone_number::
    #   The phone number to exchange to. The phone number should be in E.164 format (i.e. +1XXXXXXXXXX).
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
    # user::
    #   The `user` object affected by this API call. See the [Get user endpoint](https://stytch.com/docs/api/get-user) for complete response field details.
    #   The type of this field is +User+ (+object+).
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    def exchange_primary_factor(
      user_id:,
      email_address: nil,
      phone_number: nil
    )
      headers = {}
      request = {}
      request[:email_address] = email_address unless email_address.nil?
      request[:phone_number] = phone_number unless phone_number.nil?

      put_request("/v1/users/#{user_id}/exchange_primary_factor", request, headers)
    end

    # Delete a User from Stytch.
    #
    # == Parameters:
    # user_id::
    #   The unique ID of a specific User.
    #   The type of this field is +String+.
    #
    # == Returns:
    # An object with the following fields:
    # request_id::
    #   Globally unique UUID that is returned with every API call. This value is important to log for debugging purposes; we may ask for this value to help identify a specific API call when helping you debug an issue.
    #   The type of this field is +String+.
    # user_id::
    #   The unique ID of the deleted User.
    #   The type of this field is +String+.
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    def delete(
      user_id:
    )
      headers = {}
      delete_request("/v1/users/#{user_id}", headers)
    end

    # Delete an email from a User.
    #
    # == Parameters:
    # email_id::
    #   The `email_id` to be deleted.
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
    # user::
    #   The `user` object affected by this API call. See the [Get user endpoint](https://stytch.com/docs/api/get-user) for complete response field details.
    #   The type of this field is +User+ (+object+).
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    def delete_email(
      email_id:
    )
      headers = {}
      delete_request("/v1/users/emails/#{email_id}", headers)
    end

    # Delete a phone number from a User.
    #
    # == Parameters:
    # phone_id::
    #   The `phone_id` to be deleted.
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
    # user::
    #   The `user` object affected by this API call. See the [Get user endpoint](https://stytch.com/docs/api/get-user) for complete response field details.
    #   The type of this field is +User+ (+object+).
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    def delete_phone_number(
      phone_id:
    )
      headers = {}
      delete_request("/v1/users/phone_numbers/#{phone_id}", headers)
    end

    # Delete a WebAuthn registration from a User.
    #
    # == Parameters:
    # webauthn_registration_id::
    #   The `webauthn_registration_id` to be deleted.
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
    # user::
    #   The `user` object affected by this API call. See the [Get user endpoint](https://stytch.com/docs/api/get-user) for complete response field details.
    #   The type of this field is +User+ (+object+).
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    def delete_webauthn_registration(
      webauthn_registration_id:
    )
      headers = {}
      delete_request("/v1/users/webauthn_registrations/#{webauthn_registration_id}", headers)
    end

    # Delete a biometric registration from a User.
    #
    # == Parameters:
    # biometric_registration_id::
    #   The `biometric_registration_id` to be deleted.
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
    # user::
    #   The `user` object affected by this API call. See the [Get user endpoint](https://stytch.com/docs/api/get-user) for complete response field details.
    #   The type of this field is +User+ (+object+).
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    def delete_biometric_registration(
      biometric_registration_id:
    )
      headers = {}
      delete_request("/v1/users/biometric_registrations/#{biometric_registration_id}", headers)
    end

    # Delete a TOTP from a User.
    #
    # == Parameters:
    # totp_id::
    #   The `totp_id` to be deleted.
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
    # user::
    #   The `user` object affected by this API call. See the [Get user endpoint](https://stytch.com/docs/api/get-user) for complete response field details.
    #   The type of this field is +User+ (+object+).
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    def delete_totp(
      totp_id:
    )
      headers = {}
      delete_request("/v1/users/totps/#{totp_id}", headers)
    end

    # Delete a crypto wallet from a User.
    #
    # == Parameters:
    # crypto_wallet_id::
    #   The `crypto_wallet_id` to be deleted.
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
    # user::
    #   The `user` object affected by this API call. See the [Get user endpoint](https://stytch.com/docs/api/get-user) for complete response field details.
    #   The type of this field is +User+ (+object+).
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    def delete_crypto_wallet(
      crypto_wallet_id:
    )
      headers = {}
      delete_request("/v1/users/crypto_wallets/#{crypto_wallet_id}", headers)
    end

    # Delete a password from a User.
    #
    # == Parameters:
    # password_id::
    #   The `password_id` to be deleted.
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
    # user::
    #   The `user` object affected by this API call. See the [Get user endpoint](https://stytch.com/docs/api/get-user) for complete response field details.
    #   The type of this field is +User+ (+object+).
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    def delete_password(
      password_id:
    )
      headers = {}
      delete_request("/v1/users/passwords/#{password_id}", headers)
    end

    # Delete an OAuth registration from a User.
    #
    # == Parameters:
    # oauth_user_registration_id::
    #   The `oauth_user_registration_id` to be deleted.
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
    # user::
    #   The `user` object affected by this API call. See the [Get user endpoint](https://stytch.com/docs/api/get-user) for complete response field details.
    #   The type of this field is +User+ (+object+).
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    def delete_oauth_registration(
      oauth_user_registration_id:
    )
      headers = {}
      delete_request("/v1/users/oauth/#{oauth_user_registration_id}", headers)
    end
  end
end
