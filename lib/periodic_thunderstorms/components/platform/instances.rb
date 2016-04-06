module PeriodicThunderstorms
  module Components
    module Platform
      # Instances API
      module Instances
        def self.included(base) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
          base.class_eval do
            # Retrieve all element instances from a specified path. The
            # instances go through Cloud Elements to your console. Specifying an
            # instance that does not exist results in an error response.
            get '/instances', as: :instances, params: { optional: @pagination + [:hydrate] }

            # Create a new element instance in your console. Instance creation
            # will flow through Cloud Elements to your console.
            post '/instances', as: :create_instance

            # Retrieve events for all element instances
            get '/instances/events', as: :instances_events

            # Retrieve an event for all element instances
            get '/instances/events/:id', as: :instance_event

            # Delete an instance associated with a given ID from your console.
            # Specifying an instance associated with a given ID that does not
            # exist will result in an error message.
            delete '/instances/:id', as: :delete_instance

            # Retrieve an element instance associated with a given ID from a
            # specified path. The instance goes through Cloud Elements to your
            # console. Specifying an instance with an associated ID that does
            # not exist results in an error response.
            get '/instances/:id', as: :instance

            # Update an instance associated with a given ID from your console.
            # Specifying an instance associated with an ID that does not exist
            # will result in an error message.
            put '/instances/:id', as: :update_instance

            # Retrieve configuration for an element instance
            get '/instances/:id/configuration', as: :instance_configs

            # Retrieve configuration for an element instance
            get '/instances/:id/configuration/:config_id', as: :instance_config

            # Update configuration for an element instance
            patch '/instances/:id/configuration/:config_id', as: :update_instance_config

            # Retrieve an instance specific swagger documentation
            get '/instance/:id/docs', as: :instance_doc

            # Retrieve events for an element instance
            get '/instances/:id/events', as: :instance_events

            # Retrieve an event for an element instance
            get '/instances/:id/events/:event_id', as: :instance_event

            # Delete the transformation for an element instance
            delete '/instances/:id/transformations', as: :delete_instance_transformations

            # Retreive an element instance transformations
            get '/instances/:id/transformations', as: :instance_transformations

            # Delete the transformation for an element instance for a specific object
            delete '/instances/:id/transformations/:name', as: :delete_instance_transformation

            # Retrieve an element instance transformation for a specific object
            get '/instances/:id/transformations/:name', as: :instance_transformation

            # Create a transformation for an element instance for a specific object
            post '/instances/:id/transformations/:name', as: :create_instance_transformation

            # Update the transformation for an element instance for a specific object
            put '/instances/:id/transformations/:name', as: :update_instance_transformation
          end
        end
      end
    end
  end
end
