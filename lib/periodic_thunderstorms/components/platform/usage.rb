module PeriodicThunderstorms
  module Components
    module Platform
      # Usage api
      module Usage
        def self.included(base) # rubocop:disable Metrics/MethodLength
          base.class_eval do
            timerange = { required: %i(from to), optional: :interval }.freeze
            # Retrieve the usage logs for your account.
            get '/usage', as: :usages, params: {
              optional: %i(
                hub
                keys[]
                tags[]
                status
                from
                to
                searchText
                pageOffset
                pageSize
              )
            }
            # Retrieve the number of element API calls within a given date/time
            # range
            get '/usage/analytics/activity', as: :activity, params: timerange
            # Retrieve the number of element API calls for each element within a
            # given date/time range
            get '/usage/analytics/activity/elements', as: :elements_activity, params: timerange
            # Retrieve the number of successes and failures of element API calls
            # within a given date/time range.
            get '/usage/analytics/statuses', as: :statuses, params: timerange
            # Retrieve the response times of element API calls within a given
            # date/time range
            get '/usage/analytics/times', as: :times, params: timerange
            # Retrieve the usage record by id
            get '/usage/:id', as: :usage
          end
        end
      end
    end
  end
end
