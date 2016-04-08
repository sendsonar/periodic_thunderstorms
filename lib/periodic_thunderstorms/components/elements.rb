module PeriodicThunderstorms
  module Components
    # Elements API
    module Elements
      def self.included(base) # rubocop:disable Metrics/MethodLength
        base.class_eval do
          get 'elements', as: :elements, params: { optional: @pagination }
          # Retrieve all available element keys
          get 'elements/keys', as: :elements_keys, params: { optional: @pagination }
          # Swagger 2.0 schema for the element
          get 'elements/:id/docs', as: :element_docs, params: { optional: :operationId }
          # Retrieve metadata for a specific element
          get 'elements/:id/metadata', as: :element_metadata
          # Retrieve a specific element associated with an element key.
          # Specifygin an element associated with an element key that does not
          # exist results in an error response
          get 'elements/:key', as: :element
          # Retrieve all element instances from a specified path. The instances
          # go through Cloud Elements to your console. Specifying an instance
          # that does not exist results in an error response.
          get 'elements/:key/instances', as: :element_instances

          # Create a new element instance in your console. Instance creation
          # will flow through Cloud Elements to your console.
          post 'elements/:key/instances', as: :create_element_instance

          # Delete an instance associated with a given ID from your console.
          # Specifying an instance associated with a given ID that does not
          # exist will result in an error message.
          delete 'elements/:key/instances/:id', as: :delete_element_instance

          # Retrieve an element instance associated with a given ID from a
          # specified path. The instance goes through Cloud Elements to your
          # console. Specifying an instance with an associated ID that does not
          # exist results in an error response.
          get 'elements/:key/instances/:id', as: :element_instance

          # Update an instance associated with a given ID from your console.
          # Specifying an instance associated with an ID that does not exist
          # will result in an error message.
          put 'elements/:key/instances/:id', as: :update_element_instance

          # Retrieve the OAuth 1 request token. Not applicable with OAuth 2
          # Elements
          get 'elements/:key/oauth/token', as: :element_oauth_token, params: {
            required: %i(apiKey apiSecret callbackUrl),
            optional: %i(scope state siteAddress)
          }

          # Retrieve the OAuth 2 redirect URL associated with the specified
          # element. Specifying an element key associated with an element that
          # does not exist results in an error response.
          get 'elements/:key/oauth/url', as: :element_oauth_url, params: {
            required: %i(apiKey apiSecret callbackUrl),
            optional: %i(scope state callbackProxy requestToken siteAddress)
          }
        end
      end
    end
  end
end
