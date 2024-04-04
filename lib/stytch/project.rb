# frozen_string_literal: true

# !!!
# WARNING: This file is autogenerated
# Only modify code within MANUAL() sections
# or your changes may be overwritten later!
# !!!

require_relative 'request_helper'

module Stytch
  class Project
    include Stytch::RequestHelper

    def initialize(connection)
      @connection = connection
    end

    def metrics
      headers = {}
      query_params = {}
      request = request_with_query_params('/v1/projects/metrics', query_params)
      get_request(request, headers)
    end
  end
end
