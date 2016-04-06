module PeriodicThunderstorms
  class Client < HttpApiBuilder::BaseClient
    include PeriodicThunderstorms::HttpClient

    base_url 'https://api.cloud-elements.com/elements/api-v2'

    @pagination = %i(nextPage pageSize)

  end
end
