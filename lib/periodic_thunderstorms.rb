require 'bundler/setup'
Bundler.setup(:default)

require 'require_all'

require 'http_api_builder'

require 'periodic_thunderstorms/version'
require 'periodic_thunderstorms/http_client'

require_rel 'periodic_thunderstorms/components/**/*.rb'

require 'periodic_thunderstorms/client'

# Periodic Thunderstorms is a utility wrapper for the CloudElements APi
module PeriodicThunderstorms
  def self.client(auth)
    Client.new(auth)
  end
end
