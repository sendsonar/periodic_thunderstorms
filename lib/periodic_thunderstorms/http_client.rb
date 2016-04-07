require 'http'

module PeriodicThunderstorms
  # HTTP client implementing CloudElements auth
  module HttpClient
    def request(verb, path, form:, query:, body:, json:) # rubocop:disable Metrics/ParameterLists
      url = URI.join(self.class.base_url || '', path)
      HTTP.auth(@auth).send(verb, url, form: form, params: query, body: body, json: json)
    end
  end
end
