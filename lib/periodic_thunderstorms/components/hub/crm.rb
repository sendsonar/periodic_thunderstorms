module PeriodicThunderstorms
  module Components
    module Hub
      # CRM api
      module Crm
        def self.included(base) # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
          base.class_eval do
            get_params = %i(page pageSize where includeDeleted)
            # Find accounts in the CRM system, using the provided CEQL search
            # expression. The search expression in CEQL is the WHERE clause in a
            # typical SQL query, but without the WHERE keyword. For example, to
            # search for all accounts whose name contains the word 'data', the
            # search expression parameter will be where=name like '%data%'. If a
            # search expression is not provided, then the first 200 records will be
            # returned. If a value of true is specified for the includeDeleted flag,
            # then any soft-deleted records will also be considered in the searched
            # records.
            get 'accounts', as: :crm_accounts, params: { optional: get_params }
            # Create a new account in the CRM system. Account creation will flow
            # through Cloud Elements to your CRM service. With the exception of the
            # 'id' field, the required fields indicated in the 'Account' model are
            # those required to create a new account.
            post 'accounts', as: :create_crm_account
            # Delete an account associated with a given ID from your CRM system.
            # Specifying an account associated with a given ID that does not exist
            # will result in an error message.
            delete 'accounts/:id', as: :delete_crm_account
            # Retrieve an account associated with a given ID from the CRM
            # system.Specifying an account with a specified ID that does not exist
            # will result in an error response.
            get 'accounts/:id', as: :crm_account
            # Update an account associated with a given ID in the CRM system. The
            # update API uses the PATCH HTTP verb, so only those fields provided in
            # the account object will be updated, and those fields not provided will
            # be left aloneUpdating an account with a specified ID that does not
            # exist will result in an error response.
            patch 'accounts/:id', as: :sync_crm_account
            # Update an account.
            put 'accounts/:id', as: :update_crm_account
            # BETA Execute a bulk query synchronously.
            get 'bulk/query', as: :blocking_bulk_crm_query, params: { required: :q }
            # BETA Create an asynchronous bulk query job.
            post 'bulk/query', as: :asynch_block_crm_query, params: { required: :q, optional: :fileFormat }
            # BETA Retrieve the errors of a bulk job.
            get 'bulk/:id/errors', as: :bulk_crm_query_errors
            # BETA Retrieve the status of a bulk job.
            get 'bulk/:id/status', as: :bulk_crm_query_status
            # BETA Retrieve the results of an asynchronous bulk query.
            get 'bulk/:id/:object', as: :bulk_crm_query_result
            # BETA Upload a file of objects to be bulk uploaded to the provider.
            post 'bulk/:object', as: :upload_bulk_crm_object, params: { optional: :identifierFieldName }
            # Find contacts in the CRM system, using the provided CEQL search
            # expression. The search expression in CEQL is the WHERE clause in a
            # typical SQL query, but without the WHERE keyword. For example, to
            # search for all contacts whose name contains the word 'jones', the
            # search expression parameter will be where=name='%jones%'. If a search
            # expression is not provided, then the first 200 records will be
            # returned. If a value of true is specified for the includeDeleted flag,
            # then any soft-deleted records will also be considered in the searched
            # records.
            get 'contacts', as: :crm_contacts, params: { optional: get_params }
            # Create a new contact in the CRM system. Contact creation will flow
            # through Cloud Elements to your CRM service. With the exception of the
            # 'id' field, the required fields indicated in the 'Contact' model are
            # those required to create a new contact.
            post 'contacts', as: :create_crm_contact
            # Delete a contact associated with a given ID from your CRM system.
            # Specifying a contact associated with a given ID that does not exist
            # will result in an error message. .
            delete 'contacts/:id', as: :delete_crm_contact
            # Retrieve a contact associated with a given ID from the CRM
            # system.Specifying a contact with a specified ID that does not exist
            # will result in an error response.
            get 'contacts/:id', as: :crm_contact
            # Update the contact associated with the given ID in the CRM system. The
            # update API uses the PATCH HTTP verb, so only those fields provided in
            # the contact object will be updated, and those fields not provided will
            # be left aloneUpdating a contact with a specified ID that does not
            # exist will result in an error response.
            patch 'contacts/:id', as: :sync_crm_contact
            # Find leads in the CRM system, using the provided CEQL search
            # expression. The search expression in CEQL is the WHERE clause in a
            # typical SQL query, but without the WHERE keyword. For example, to
            # search for all leads whose name contains the word 'data', the search
            # expression parameter will be where=name like '%data%'. If a search
            # expression is not provided, then the first 200 records will be
            # returned. If a value of true is specified for the includeDeleted flag,
            # then any soft-deleted records will also be considered in the searched
            # records.
            get 'leads', as: :crm_leads, params: { optional: get_params }
            # Create a new lead in the CRM system. Lead creation will flow through
            # Cloud Elements to your CRM service. With the exception of the 'id'
            # field, the required fields indicated in the 'Lead' model are those
            # required to create a new lead.
            post 'leads', as: :create_crm_lead
            # Delete a lead associated with a given ID from the CRM system.
            # Specifying a leadassociated with a given ID that does not exist will
            # result in an error message.
            delete 'leads/:id', as: :delete_crm_lead
            # Retrieve a lead associated with a given ID from the CRM
            # system.Specifying a lead with a specified ID that does not exist will
            # result in an errorresponse.
            get 'leads/:id', as: :crm_lead
            # Update a lead associated with the given ID in the CRM system. The
            # update API uses the PATCH HTTP verb, so only those fields provided in
            # the lead object will be updated, and those fields not provided will be
            # left alone.Updating a lead with a specified ID that does not exist
            # will result in an error response.
            patch 'leads/:id', as: :sync_crm_lead
            # Get a list of all the available objects.
            get 'objects', as: :crm_objects
            # Get a list of all the field for an object.
            get 'objects/:object/metadata', as: :crm_object_metadata
            # Find opportunities in the CRM system, using the provided CEQL search
            # expression. The search expression in CEQL is the WHERE clause in a
            # typical SQL query, but without the WHERE keyword. For example, to
            # search for all opportunities whose name contains the word 'data', the
            # search expression parameter will be where=name like '%data%'. If a
            # search expression is not provided, then the first 200 records will be
            # returned. If a value of true is specified for the includeDeleted flag,
            # then any soft-deleted records will also be considered in the searched
            # records.
            get 'opportunities', as: :crm_oppertunities, params: { optional: get_params }
            # Create a new opportunity in the CRM system. Opportunity creation will
            # flow through Cloud Elements to your CRM service. With the exception of
            # the 'id' field, the required fields indicated in the 'Opportunity'
            # model are those required to create a new opportunity.
            post 'opportunities', as: :create_crm_oppertunity
            # Delete an opportunity associated with a given ID from the CRM system.
            # Specifying an opportunity associated with a given ID that does not
            # exist will result in an error message.
            delete 'opportunities/:id', as: :delete_crm_oppertunity
            # Retrieve an opportunity associated with a given ID from the CRM
            # system.Specifying an opportunity with a specified ID that does not
            # exist will result in an error response.
            get 'opportunities/:id', as: :crm_oppertunity
            # Update the opportunity associated with the given ID in the CRM system.
            # The update API uses the PATCH HTTP verb, so only those fields provided
            # in the opportunity object will be updated, and those fields not
            # provided will be left alone.Updating an opportunity with a specified
            # ID that does not exist will result in an error response.
            patch 'opportunities/:id', as: :sync_crm_oppertunity
            # Ping the Element to confirm that the Hub Element has a heartbeat. If
            # the Element does not have a heartbeat, an error message will be
            # returned.
            get 'ping', as: :crm_ping
            # Find users in the CRM system, using the provided CEQL search
            # expression. The search expression in CEQL is the WHERE clause in a
            # typical SQL query, but without the WHERE keyword. For example, to
            # search for all users whose name contains the word 'smith', the search
            # expression parameter will be where=name='%smith%'. If a search
            # expression is not provided, then the first 200 records will be
            # returned. If a value of true is specified for the includeDeleted flag,
            # then any soft-deleted records will also be considered in the searched
            # records.
            get 'users', as: :crm_users, params: { optional: get_params }
            # Create a new user in the CRM system. User creation will flow through
            # Cloud Elements to your CRM service. With the exception of the 'id'
            # field, the required fields indicated in the 'User' model are those
            # required to create a new user.
            post 'users', as: :create_crm_user
            # Delete a user associated with a given ID from the CRM system.
            # Specifying a user associated with a given ID that does not exist will
            # result in an error message.
            delete 'users/:id', as: :delete_crm_user
            # Retrieve a user associated with a given ID from the CRM
            # system.Specifying a user with a specified ID that does not exist will
            # result in an errorresponse.
            get 'users/:id', as: :crm_user
            # Update a user associated with a given ID in the CRM system. The update
            # API uses the PATCH HTTP verb, so only those fields provided in the
            # user object will be updated, and those fields not provided will be
            # left alone.Updating a user with a specified ID that does not exist
            # will result in an error response
            patch 'users/:id', as: :sync_crm_user
            # Find objects in the CRM system, using the provided object name and
            # CEQL search expression. The search expression in CEQL is the WHERE
            # clause in a typical SQL query, but without the WHERE keyword. For
            # example, to search for all contacts whose name contains the word
            # 'data', the search expression parameter will be where=name like
            # '%data%'. If a search expression is not provided, then the first 200
            # records will be returned. If a value of true is specified for the
            # includeDeleted flag, then any soft-deleted records will also be
            # considered in the searched records.
            get ':object', as: :crm_objects, params: { optional: get_params }
            # Create a new object in the CRM system. The provided objectName can be
            # that of a custom or standard object. Object creation will flow through
            # Cloud Elements to your CRM service.
            post ':object', as: :create_crm_object
            # Delete an object associated with a given object name and ID from the
            # CRM system. Specifying an object associated with a given objectName
            # and ID that does not exist will result in an error message.
            delete ':object/:id', as: :delete_crm_object
            # Retrieve an object associated with a given ID from the CRM
            # system.Specifying an object with a specified ID that does not exist
            # will result in an error response.
            get ':object/:id', as: :crm_object
            # Update an object associated with a given object name and ID in the CRM
            # system. The update API uses the PATCH HTTP verb, so only those fields
            # provided in the object will be updated, and those fields not provided
            # will be left alone.Updating an object with a specified ID that does
            # not exist will result in an error response.
            patch ':object/:id', as: :sync_crm_object
          end
        end
      end
    end
  end
end
