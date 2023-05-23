# frozen_string_literal: true

require_relative "../request_helper"

module Stytch
  class Passwords
    include Stytch::RequestHelper
    attr_reader :passwords, :passwords, :passwords

    def initialize(connection)
      @connection = connection

      @email = Stytch::Passwords::Email.new(@connection)
      @sessions = Stytch::Passwords::Sessions.new(@connection)
      @existingpassword = Stytch::Passwords::ExistingPassword.new(@connection)
    end

    def strength_check(
        password: ,
        email_address: nil,
    )
      request = {
          password: password,
      }
      request[:email_address] = email_address if email_address != nil

      post_request("/v1/b2b/passwords/strength_check", request)
    end

    def migrate(
        email_address: ,
        hash: ,
        hash_type: ,
        organization_id: ,
        name: ,
        md_5_config: nil,
        argon_2_config: nil,
        sha_1_config: nil,
        scrypt_config: nil,
        trusted_metadata: nil,
        untrusted_metadata: nil,
    )
      request = {
          email_address: email_address,
          hash: hash,
          hash_type: hash_type,
          organization_id: organization_id,
          name: name,
      }
      request[:md_5_config] = md_5_config if md_5_config != nil
      request[:argon_2_config] = argon_2_config if argon_2_config != nil
      request[:sha_1_config] = sha_1_config if sha_1_config != nil
      request[:scrypt_config] = scrypt_config if scrypt_config != nil
      request[:trusted_metadata] = trusted_metadata if trusted_metadata != nil
      request[:untrusted_metadata] = untrusted_metadata if untrusted_metadata != nil

      post_request("/v1/b2b/passwords/migrate", request)
    end

    def authenticate(
        organization_id: ,
        email_address: ,
        password: ,
        session_token: nil,
        session_duration_minutes: nil,
        session_jwt: nil,
        session_custom_claims: nil,
    )
      request = {
          organization_id: organization_id,
          email_address: email_address,
          password: password,
      }
      request[:session_token] = session_token if session_token != nil
      request[:session_duration_minutes] = session_duration_minutes if session_duration_minutes != nil
      request[:session_jwt] = session_jwt if session_jwt != nil
      request[:session_custom_claims] = session_custom_claims if session_custom_claims != nil

      post_request("/v1/b2b/passwords/authenticate", request)
    end


    class Email
      include Stytch::RequestHelper

      def initialize(connection)
        @connection = connection

      end

      def reset_start(
          organization_id: ,
          email_address: ,
          reset_password_redirect_url: ,
          login_redirect_url: ,
          reset_password_expiration_minutes: nil,
          code_challenge: nil,
          locale: nil,
          reset_password_template_id: nil,
      )
        request = {
            organization_id: organization_id,
            email_address: email_address,
            reset_password_redirect_url: reset_password_redirect_url,
            login_redirect_url: login_redirect_url,
        }
        request[:reset_password_expiration_minutes] = reset_password_expiration_minutes if reset_password_expiration_minutes != nil
        request[:code_challenge] = code_challenge if code_challenge != nil
        request[:locale] = locale if locale != nil
        request[:reset_password_template_id] = reset_password_template_id if reset_password_template_id != nil

        post_request("/v1/b2b/passwords/email/reset/start", request)
      end

      def reset(
          password_reset_token: ,
          password: ,
          session_token: nil,
          session_duration_minutes: nil,
          session_jwt: nil,
          code_verifier: nil,
          session_custom_claims: nil,
      )
        request = {
            password_reset_token: password_reset_token,
            password: password,
        }
        request[:session_token] = session_token if session_token != nil
        request[:session_duration_minutes] = session_duration_minutes if session_duration_minutes != nil
        request[:session_jwt] = session_jwt if session_jwt != nil
        request[:code_verifier] = code_verifier if code_verifier != nil
        request[:session_custom_claims] = session_custom_claims if session_custom_claims != nil

        post_request("/v1/b2b/passwords/email/reset", request)
      end


    end
    class Sessions
      include Stytch::RequestHelper

      def initialize(connection)
        @connection = connection

      end

      def reset(
          organization_id: ,
          password: ,
          session_token: nil,
          session_jwt: nil,
      )
        request = {
            organization_id: organization_id,
            password: password,
        }
        request[:session_token] = session_token if session_token != nil
        request[:session_jwt] = session_jwt if session_jwt != nil

        post_request("/v1/b2b/passwords/session/reset", request)
      end


    end
    class ExistingPassword
      include Stytch::RequestHelper

      def initialize(connection)
        @connection = connection

      end

      def reset(
          email_address: ,
          existing_password: ,
          new_password: ,
          organization_id: ,
          session_token: nil,
          session_duration_minutes: nil,
          session_jwt: nil,
          session_custom_claims: nil,
      )
        request = {
            email_address: email_address,
            existing_password: existing_password,
            new_password: new_password,
            organization_id: organization_id,
        }
        request[:session_token] = session_token if session_token != nil
        request[:session_duration_minutes] = session_duration_minutes if session_duration_minutes != nil
        request[:session_jwt] = session_jwt if session_jwt != nil
        request[:session_custom_claims] = session_custom_claims if session_custom_claims != nil

        post_request("/v1/b2b/passwords/existing_password/reset", request)
      end


    end
  end
end