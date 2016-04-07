module PeriodicThunderstorms
  # CloudElements client
  class Client < ::HttpApiBuilder::BaseClient
    include PeriodicThunderstorms::MockHttpClient

    attr_accessor :auth

    base_url 'https://api.cloud-elements.com/elements/api-v2'

    @pagination = %i(nextPage pageSize)

    # Platform includes
    %w(Accounts ElementsBuilder Formulas Hubs Instances Organizations Usage Users).each do |const|
      include Object.const_get("PeriodicThunderstorms::Components::Platform::#{const}")
    end

    include PeriodicThunderstorms::Components::Elements

    def initialize(auth)
      @auth = auth
    end
  end
end
