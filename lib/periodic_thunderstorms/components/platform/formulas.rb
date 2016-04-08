module PeriodicThunderstorms
  module Components
    module Platform
      # Users api
      module Formulas
        def self.included(base) # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
          base.class_eval do
            # Retrieve a list of all formula templates.
            get 'formulas', as: :formulas, params: { optional: @pagination + [:includeSystem] }
            # Create a new formula template.
            post 'formulas', as: :create_formula
            # Retrieve all instances of all formula templates.
            get 'formulas/instances', as: :formulas_instances, params: { optional: @pagination }
            # Retrieve all executions for all formula instances.
            get 'formulas/instances/executions', as: :formulas_instances_executions
            # Retrieve all step executions for a formula execution.
            get 'formulas/instances/executions/:id/steps', as: :formula_instances_execution_steps
            # Delete a specific formula template.
            delete 'formulas/:id', as: :delete_formula
            # Retrieve a specific formula template.
            get 'formulas/:id', as: :formula
            # Replace a specific formula template with the provided template.
            put 'formulas/:id', as: :update_formula
            # Create a new formula configuration.
            post 'formulas/:id/configuration', as: :create_formula_configuration
            # Delete a formula configuration.
            delete 'formulas/:id/configuration/:config', as: :delete_formula_configuration
            # Retrieve a formula configuration.
            get 'formulas/:id/configuration/:config', as: :formula_configuration
            # Update a formula configuration.
            put 'formulas/:id/configuration/:config', as: :update_formula_configuration
            # Export a formula template as a JSON file.
            get 'formulas/:id/export', as: :export_formula
            # Retrieve a list of all instances associated with a particular formula template.
            get 'formulas/:id/instances', as: :formula_instances, params: { optional: @pagination }
            # Create an instance of a formula template.
            post 'formulas/:id/instances', as: :create_formula_instance
            # Delete a specific formula instance of a specific formula template.
            delete 'formulas/:id/instances/:instance', as: :delete_formula_instance
            # Retrieve a specific instance of a specific formula template.
            get 'formulas/:id/instances/:instance', as: :formula_instance
            # Replace a specific formula instance of a specific formula template with the provided instance.
            put 'formulas/:id/instances/:instance', as: :update_formula_instance
            # Deactivate a formula instance.
            delete 'formulas/:id/instances/:instance/active', as: :deactivate_formula_instance
            # Activate a formula instance.
            put 'formulas/:id/instances/:instance/active', as: :activate_formula_instance
            # Retrieve the executions of a specific formula instance of a specific formula template.
            get 'formulas/:id/instances/:instance/executions', as: :formula_instance_executions, params: { optional: @pagination }
            # Retrieve the executions of a specific formula instance of a specific formula template.
            get 'formulas/:id/instances/:instance/executions/:execution', as: :formula_instance_execution
            # Retrieve all formula steps.
            get 'formulas/:id/steps', as: :formula_steps
            # Create a new formula step.
            post 'formulas/:id/steps', as: :create_formula_step
            # Delete a formula step.
            delete 'formulas/:id/steps/:step', as: :delete_formula_step
            # Retrieve a formula step.
            get 'formulas/:id/steps/:step', as: :formula_step
            # Update a formula step.
            put 'formulas/:id/steps/:step', as: :update_formula_step
            # Create a new formula trigger.
            post 'formulas/:id/triggers', as: :create_formula_trigger
            # Delete a formula trigger.
            delete 'formulas/:id/triggers/:trigger', as: :delete_formula_trigger
            # Retrieve a formula trigger.
            get 'formulas/:id/triggers/:trigger', as: :formula_trigger
            # Update a formula trigger.
            put 'formulas/:id/triggers/:trigger', as: :update_formula_trigger
          end
        end
      end
    end
  end
end
