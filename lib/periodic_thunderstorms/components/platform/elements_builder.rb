module PeriodicThunderstorms
  module Components
    module Platform
      # Elements builder APIs
      module ElementsBuilder
        def self.included(base) # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
          base.class_eval do
            # Create a new element.
            post '/elements', as: :create_element
            # Delete an element.
            delete '/elements/:id', as: :delete_element
            # Update an element associated with an element key.
            put '/elements/:id', as: :update_element
            # De-activate an element, which will remove it from your elements catalog.
            delete '/elements/:id/active', as: :deactivate_element
            # Activate an element to publish it in your elements catalog.
            put '/elements/:id/active', as: :activate_element
            # Retrieve a specific element configuration associated with an element key. Specifying an element associated with an element key that does not exist results in an error response.
            get '/elements/:id/configuration', as: :element_configs
            # Create a new configuration value for an element
            post '/elements/:id/configuration', as: :create_element_config
            # Delete a configuration value for an element
            delete '/elements/:id/configuration/:key', as: :delete_element_config
            # Update an existing configuration value for an element
            put '/elements/:id/configuration/:key', as: :update_element_config
            # Downloads a specific element JSON data in a file associated with an element key. Specifying an element associated with an element key that does not exist results in an error response.
            get '/elements/:id/export', as: :export_element
            # Retrieve all of the default parameters for an element
            get '/elements/:id/parameters', as: :element_parameters
            # Create a new default parameter for an element
            post '/elements/:id/parameters', as: :create_element_parameter
            # Delete a default parameter for an element
            delete '/elements/:id/parameters/:param_id', as: :delete_element_parameter
            # Update a default parameter for an element
            put '/elements/:id/parameters/:param_id', as: :update_element_parameter
            # Retrieve all of the resources that exist for a custom element
            get '/elements/:id/resources', as: :element_resources
            # Create a new resource for a custom element
            post '/elements/:id/resources', as: :create_element_resource
            # Delete a resource for a custom element
            delete '/elements/:id/resources/:resource_id', as: :delete_element_resource
            # Update an existing resource for an element
            put '/elements/:id/resources/:resource_id', as: :update_element_resource
            # Delete the model for this custom element's resource
            delete '/elements/:id/resources/:resource_id/models', as: :delete_element_resource_model
            # Retrieve the models that exists for a custom element's resource
            get '/elements/:id/resources/:resource_id/models', as: :element_resource_models
            # Create a new model for a custom element's resource
            post '/elements/:id/resources/:resource_id/models', as: :create_element_resource_model
            # Retrieve all of the parameters for a resource
            get '/elements/:id/resources/:resource_id/parameters', as: :element_resource_parameters
            # Create a new parameter for a custom element's resource
            post '/elements/:id/resources/:resource_id/parameters', as: :create_element_resource_parameter
            # Delete one of the parameters for a custom element's resource
            delete '/elements/:id/resources/:resource_id/parameters/:param_id', as: :delete_element_resource_parameters
            # Update an existing parameters for an element's resource
            put '/elements/:id/resources/:resource_id/parameters/:param_id', as: :update_element_resource_parameters
          end
        end
      end
    end
  end
end
