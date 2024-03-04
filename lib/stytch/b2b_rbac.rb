# frozen_string_literal: true

# !!!
# WARNING: This file is autogenerated
# Only modify code within MANUAL() sections
# or your changes may be overwritten later!
# !!!

require_relative 'request_helper'

module StytchB2B
  class RBAC
    include Stytch::RequestHelper

    def initialize(connection)
      @connection = connection
    end

    # Get the active RBAC Policy for your current Stytch Project. An RBAC Policy is the canonical document that stores all defined Resources and Roles within your RBAC permissioning model.
    #
    # When using the backend SDKs, the RBAC Policy will be cached to allow for local evaluations, eliminating the need for an extra request to Stytch. The policy will be refreshed if an authorization check is requested and the RBAC policy was last updated more than 5 minutes ago.
    #
    # Resources and Roles can be created and managed within the [Dashboard](/dashboard/rbac). Additionally, [Role assignment](https://stytch.com/docs/b2b/guides/rbac/role-assignment) can be programmatically managed through certain Stytch API endpoints.
    #
    # Check out the [RBAC overview](https://stytch.com/docs/b2b/guides/rbac/overview) to learn more about Stytch's RBAC permissioning model.
    #
    # == Parameters:
    #
    # == Returns:
    # An object with the following fields:
    # request_id::
    #   Globally unique UUID that is returned with every API call. This value is important to log for debugging purposes; we may ask for this value to help identify a specific API call when helping you debug an issue.
    #   The type of this field is +String+.
    # status_code::
    #   The HTTP status code of the response. Stytch follows standard HTTP response status code patterns, e.g. 2XX values equate to success, 3XX values are redirects, 4XX are client errors, and 5XX are server errors.
    #   The type of this field is +Integer+.
    # policy::
    #   The RBAC Policy document that contains all defined Roles and Resources – which are managed in the [Dashboard](/dashboard/rbac). Read more about these entities and how they work in our [RBAC overview](https://stytch.com/docs/b2b/guides/rbac/overview).
    #   The type of this field is nilable +Policy+ (+object+).
    def policy
      headers = {}
      query_params = {}
      request = request_with_query_params('/v1/b2b/rbac/policy', query_params)
      get_request(request, headers)
    end
  end
end