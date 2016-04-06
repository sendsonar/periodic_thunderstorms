module PeriodicThunderstorms
  module Components
    module Platform
      # Hubs api
      module Organizations
        def self.included(base)
          base.class_eval do
            # Delete the default transformation for an element within an
            # organization. The key field denotes the element being referenced
            # in the API call, i.e. dropbox.
            delete '/organizations/elements/{keyOrId}/transformations', as:
            # Retrieve the default transformation for a specific element within
            # an organization. The key field denotes the element being
            # referenced in the API call, i.e. dropbox.
            get '/organizations/elements/{keyOrId}/transformations', as:
            # Delete the default transformation for an object for a specific
            # element within an organization. The key field denotes the element
            # being referenced in the API call, i.e. dropbox.
            delete '/organizations/elements/{keyOrId}/transformations/{objectName}', as:
            # Retrieve the default transformation for an object for a specific
            # element within an organization. The key field denotes the element
            # being referenced in the API call, i.e. dropbox.
            get '/organizations/elements/{keyOrId}/transformations/{objectName}', as:
            # Create a default transformation for a specific object for all
            # elements with the given key, within an organization. The key field
            # denotes the element being referenced in the API call, i.e.
            # dropbox.
            post '/organizations/elements/{keyOrId}/transformations/{objectName}', as:
            # Update the default transformation for an object for a specific
            # element element within an organization. The key field denotes the
            # element being referenced in the API call, i.e. dropbox.
            put '/organizations/elements/{keyOrId}/transformations/{objectName}', as:
            # Delete all object definitions within an organization.
            delete '/organizations/objects/definitions', as:
            # Retrieve all of the object definitions within an organization.
            get '/organizations/objects/definitions', as:
            # Create multiple object definitions within an organization. The
            # definitions allow you to define what an object looks like within
            # an organization.
            post '/organizations/objects/definitions', as:
            # Delete an object definition associated with a specific objectName
            # within an organization. Specifying an object definition associated
            # with a given objectName that does not exist will result in an
            # error response.
            delete '/organizations/objects/{objectName}/definitions', as:
            # Retrieve a specific object definition associated with an
            # objectName within an organization.
            get '/organizations/objects/{objectName}/definitions', as:
            # Create a new object definition associated with an objectName
            # within an organization. The definitions allow you to define what
            # an object looks like within an organization.
            post '/organizations/objects/{objectName}/definitions', as:
            # Update a specific object's definition associated with a specific
            # objectName within an organization. Specifying an object definition
            # associated with a given objectName that does not exist will result
            # in an error response.
            put '/organizations/objects/{objectName}/definitions', as:
            # Find users within your default organizational account. The CEQL
            # search expression or the where clause, without the WHERE keyword,
            # in a typical SQL query. For example, to search for users
            # containing the name 'greg', the search expression will be where
            # name=‘greg’. When this parameter is omitted, all accounts are
            # returned in a paginated fashion.
            get '/organizations/users', as:
            # Create a user under the default organization account
            post '/organizations/users', as:
            # Retrieve a user associated with an email or ID within the default
            # organization. Specifying a user associated with a given emailOrId
            # that does not exist will result in an error response.
            get '/organizations/users/{emailOrId:.+}', as:
            # Delete a user associated with an ID within your organization.
            # Specifying a user associated with a given ID that does not exist
            # will result in an error response.
            delete '/organizations/users/{id}', as:
            # Update a user associated with an ID within your organization.
            # Specifying a user associated with a given ID that does not exist
            # will result in an error response.
            patch '/organizations/users/{id}', as:
