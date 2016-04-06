require 'http'

module PeriodicThunderstorms
    module HttpClient
      def request(verb, path, form:, query:, body:, json:) # rubocop:disable Metrics/ParameterLists
        url = URI.join(self.class.base_url || '', path)
        HTTP.auth(ENV['CLOUDELEMENTS_AUTH']).send(verb, url, form: form, params: query, body: body, json: json)
      end
    end
  end
end
