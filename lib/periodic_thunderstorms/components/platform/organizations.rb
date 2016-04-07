module PeriodicThunderstorms
  module Components
    module Platform
      # Organizations api
      module Organizations
        def self.included(base) # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
          base.class_eval do
            # Delete the default transformation for an element within an
            # organization. The key field denotes the element being referenced
            # in the API call, i.e. dropbox.
            delete '/organizations/elements/:key/transformations', as: :delete_element_default_transformation
            # Retrieve the default transformation for a specific element within
            # an organization. The key field denotes the element being
            # referenced in the API call, i.e. dropbox.
            get '/organizations/elements/:key/transformations', as: :default_element_transformation
            # Delete the default transformation for an object for a specific
            # element within an organization. The key field denotes the element
            # being referenced in the API call, i.e. dropbox.
            delete '/organizations/elements/:key/transformations/:object', as: :delete_element_object_default_transformation
            # Retrieve the default transformation for an object for a specific
            # element within an organization. The key field denotes the element
            # being referenced in the API call, i.e. dropbox.
            get '/organizations/elements/:key/transformations/:object', as: :element_object_default_transformation
            # Create a default transformation for a specific object for all
            # elements with the given key, within an organization. The key field
            # denotes the element being referenced in the API call, i.e.
            # dropbox.
            post '/organizations/elements/:key/transformations/:object', as: :create_element_object_default_transformation
            # Update the default transformation for an object for a specific
            # element element within an organization. The key field denotes the
            # element being referenced in the API call, i.e. dropbox.
            put '/organizations/elements/:key/transformations/:object', as: :update_element_object_default_transformation
            # Delete all object definitions within an organization.
            delete '/organizations/objects/definitions', as: :delete_organization_objects
            # Retrieve all of the object definitions within an organization.
            get '/organizations/objects/definitions', as: :all_organization_objects
            # Create multiple object definitions within an organization. The
            # definitions allow you to define what an object looks like within
            # an organization.
            post '/organizations/objects/definitions', as: :create_organization_objects
            # Delete an object definition associated with a specific objectName
            # within an organization. Specifying an object definition associated
            # with a given objectName that does not exist will result in an
            # error response.
            delete '/organizations/objects/:object/definitions', as: :delete_organization_object
            # Retrieve a specific object definition associated with an
            # objectName within an organization.
            get '/organizations/objects/:object/definitions', as: :organization_object
            # Create a new object definition associated with an objectName
            # within an organization. The definitions allow you to define what
            # an object looks like within an organization.
            post '/organizations/objects/:object/definitions', as: :create_organization_object
            # Update a specific object's definition associated with a specific
            # objectName within an organization. Specifying an object definition
            # associated with a given objectName that does not exist will result
            # in an error response.
            put '/organizations/objects/:object/definitions', as: :update_organization_object
            # Find users within your default organizational account. The CEQL
            # search expression or the where clause, without the WHERE keyword,
            # in a typical SQL query. For example, to search for users
            # containing the name 'greg', the search expression will be where
            # name='greg'. When this parameter is omitted, all accounts are
            # returned in a paginated fashion.
            get '/organizations/users', as: :find_organzation_users, params: {
              optional: @pagination + [:where]
            }
            # Create a user under the default organization account
            post '/organizations/users', as: :create_organzation_user
            # Retrieve a user associated with an email or ID within the default
            # organization. Specifying a user associated with a given emailOrId
            # that does not exist will result in an error response.
            get '/organizations/users/:emails', as: :organization_users
            # Delete a user associated with an ID within your organization.
            # Specifying a user associated with a given ID that does not exist
            # will result in an error response.
            delete '/organizations/users/:id', as: :delete_organzation_user
            # Update a user associated with an ID within your organization.
            # Specifying a user associated with a given ID that does not exist
            # will result in an error response.
            patch '/organizations/users/:id', as: :update_organzation_user
          end
        end
      end
    end
  end
end
