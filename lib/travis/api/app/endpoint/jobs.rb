require 'travis/api/app'

class Travis::Api::App
  class Endpoint
    class Jobs < Endpoint
      get '/' do
        respond_with service(:find_jobs, params)
      end

      get '/:id' do
        respond_with service(:find_job, params)
      end

      delete '/:id' do
        respond_with service(:cancel_job, params)
      end
    end
  end
end
