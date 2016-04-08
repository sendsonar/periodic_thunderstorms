module PeriodicThunderstorms
  module Components
    module Platform
      # Hubs api
      module Hubs
        def self.included(base)
          base.class_eval do
            # Retrieve all available element hubs.
            get 'hubs', as: :hubs, params: { optional: @pagination }
            # Create a new hub.
            post 'hubs', as: :create_hub
            # Retrieve all available element hub keys.
            get 'hubs/keys', as: :hub_keys, params: { optional: @pagination }
            # Delete a hub.
            delete 'hubs/:key', as: :delete_hub
            # Retrieve the details about a specific hub.
            get 'hubs/:key', as: :hub
            # Retrieve all available elements for a specific hub.
            get 'hubs/:key/elements', as: :hub_elements, params: { optional: @pagination }
          end
        end
      end
    end
  end
end
