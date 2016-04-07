module PeriodicThunderstorms
  module Components
    module Platform
      # Users api
      module Users
        def self.included(base)
          base.class_eval do
            # Retrieve users within your account or organization. Find users
            # within your account or organization, using the provided CEQL
            # search expression or the where clause, without the WHERE keyword,
            # in a typical SQL query. For example, to search for users
            # containing the name 'greg', the search expression will be where
            # name='greg'. When this parameter is omitted, all accounts are
            # returned in a paginated fashion.
            get '/users', as: :all_users, params: { optional: @pagination + [:where] }
            # Retrieve a user associated with a given email or ID within your
            # account or organization. Specifying a user associated with a given
            # email or ID that does not exist will result in an error response.
            get '/users/:emails', as: :users
            # Delete a user associated with a given email or ID within your
            # account or organization. Specifying a user associated with a given
            # email or ID that does not exist will result in an error response.
            delete '/users/:id', as: :delete_user
            # Update a user associated with a given email or ID within your
            # account or organization. Specifying a user associated with a given
            # email or ID that does not exist will result in an error response.
            patch '/users/:id', as: :update_user
          end
        end
      end
    end
  end
end
