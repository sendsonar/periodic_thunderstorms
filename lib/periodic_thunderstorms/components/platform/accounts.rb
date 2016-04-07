module PeriodicThunderstorms
  module Components
    module Platform
      # Accounts api
      module Accounts
        def self.included(base) # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
          base.class_eval do
            # Retrieve accounts (identified by your organization secret). The
            # provided user secret must be that of the default admin user for
            # the organization.
            get '/accounts', as: :accounts, params: { optional:  %i(where offset pageSize) }
            # Create a sub-account (identified by your organization secret). The
            # provided user secret must be that of the default admin user for
            # the organization.
            post '/accounts', as: :create_account
            # Finds all instances for the default users' account
            get '/accounts/instances', as: :default_instances, params: { optional: @pagination }
            # Delete all object definitions within the default users' account.
            # If no object definitions exist then this will result in an error
            # response.
            delete '/accounts/objects/definitions', as: :delete_default_account_objects
            # Retrieve all of the object definitions within the users' default
            # account. Specifying an object definition that does not exist will
            # result in an error response.
            get '/accounts/objects/definitions', as: :account_default_objects
            # Create multiple object definitions within this users' default
            # account. The definitions allow you to define what an object looks
            # like within an account.
            post '/accounts/objects/definitions', as: :create_default_account_objects
            # Delete an object definition associated with an objectName within
            # the default users' account. Specifying an object name that does
            # not have an object definition will result in an error response.
            delete '/accounts/objects/:object/definitions', as: :delete_default_account_object
            # Retrieve a specific object definition associated with an
            # objectName within the default users' account. Specifying an object
            # definition associated with a given objectName that does not exist
            # will result in an error response.
            get '/accounts/objects/:object/definitions', as: :default_account_object
            # Create a new object definition associated with an objectName
            # within the users' default account. The definitions allow you to
            # define what an object looks like within an account.
            post '/accounts/objects/:object/definitions', as: :create_default_account_object
            # Update a specific object's definition associated with an
            # objectName within the default users' account. Specifying an object
            # definition associated with a given objectName that does not exist
            # will result in an error response.
            put '/accounts/objects/:object/definitions', as: :update_default_account_object
            # List formula instances for an account by formula ID
            get '/accounts/:id/formulas/:formula/instances', as: :account_formula_instances
            # Delete an account (identified by your organization secret). The
            # provided user secret must be that of the default admin user for
            # the organization. WARNING: Deleting an account will deactivate all
            # users contained within that account.
            delete '/accounts/:id', as: :delete_account
            # Retrieve accounts (identified by your organization secret). The
            # provided user secret must be that of the default admin user for
            # the organization.
            get '/accounts/:id', as: :account
            # Update an account (identified by your organization secret). The
            # provided user secret must be that of the default admin user for
            # the organization. Specifying an account associated with a given ID
            # that does not exist will result in an error response.
            patch '/accounts/:id', as: :update_account
            # Delete the default transformation for all elements of a certain
            # type for this account.
            delete '/accounts/:id/elements/:key/transformations', as: :delete_account_transformations
            # Retrieve the default transformation for all elements of a certain
            # type for this account.
            get '/accounts/:id/elements/:key/transformations', as: :account_transformations
            # Delete the default transformation for an object for all elements
            # of a certain type for this account.
            delete '/accounts/:id/elements/:key/transformations/:object', as: :delete_account_object_transformations
            # Retrieve the default transformation for an object for all elements
            # of a certain type for this account.
            get '/accounts/:id/elements/:key/transformations/:object', as: :account_object_transformations
            # Create a default transformation for an object for all elements of
            # a certain type for this account.
            post '/accounts/:id/elements/:key/transformations/:object', as: :create_account_object_default_transformation
            # Update the default transformation for an object for all elements
            # of a certain type for this account.
            put '/accounts/:id/elements/:key/transformations/:object', as: :update_account_object_default_transformation
            # Finds all instances for the specified account
            get '/accounts/:id/instances', as: :account_instances, params: { optional: @pagination }
            # Delete all object definitions within a specific account. If no
            # object definitions exist then this will result in an error
            # response.
            delete '/accounts/:id/objects/definitions', as: :delete_account_objects
            # Retrieve all of the object definitions within a specific account.
            # If no object definitions exist, then this will result in an error
            # response.
            get '/accounts/:id/objects/definitions', as: :get_account_objects
            # Create multiple object definitions for a specific account. The
            # definitions allow you to define what an object looks like within
            # an account.
            post '/accounts/:id/objects/definitions', as: :create_account_objects
            # Delete an object definition associated with an objectName for a
            # specific account. Specifying an object name that does not have an
            # object definition will result in an error response.
            delete '/accounts/:id/objects/:object/definitions', as: :delete_account_object
            # Retrieve a specific object definition associated with an
            # objectName within a specific account. Specifying an object
            # definition associated with a given objectName that does not exist
            # will result in an error response.
            get '/accounts/:id/objects/:object/definitions', as: :get_account_objects
            # Create a new object definition associated with an objectName
            # within a specific account. The definitions allow you to define
            # what an object looks like within an account.
            post '/accounts/:id/objects/:object/definitions', as: :create_account_object
            # Update a specific object's definition associated with an
            # objectName within a specific account. Specifying an object
            # definition associated with a given objectName that does not exist
            # will result in an error response.
            put '/accounts/:id/objects/:object/definitions', as: :update_account_object
            # Find users within an account associated by an ID. Specifying a
            # user within an account associated with a given ID that does not
            # exist will result in an error response.
            get '/accounts/:id/users', as: :account_users, params: { optional: @pagination + [:where] }
            # Create a user within an account associated by an ID.
            post '/accounts/:id/users', as: :create_account_user
            # Retrieve an account user by name or ID within an account
            # associated by an ID. Specifying a user associated with a given
            # emailOrID or account associated with a given ID that does not
            # exist will result in an error response.
            get '/accounts/:id/users/:emails', as: :account_user
            # Update an account user by ID within an account associated by an
            # ID. Specifying a user associated with a given ID or account
            # associated with a given ID that does not exist will result in an
            # error response.
            patch '/accounts/:id/users/:id', as: :update_account_user
          end
        end
      end
    end
  end
end
