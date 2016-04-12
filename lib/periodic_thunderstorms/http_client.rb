require 'http'
require 'pry'

module PeriodicThunderstorms
  # HTTP client implementing CloudElements auth
  module HttpClient
    def request(verb, uri, form:, query:, body:, json:) # rubocop:disable Metrics/ParameterLists
      HTTP.auth(@auth).accept('application/json').headers('Content-Type' => 'application/json').request(verb, uri, form: form, params: query, body: body, json: json)
    end
  end
end
