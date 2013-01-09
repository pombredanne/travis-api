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

      get '/:id/build.sh' do
        if script = run_service(:build_script, id: params[:id])
          body script
          halt 200
        else
          halt 404
        end
      end

      # TODO needs a proper scope and should probably run on a separate endpoint rather than api.travis-ci.*
      post '/:id/log' do
        p params.slice(*%w(id number final))
        puts params[:log]
        # run_service(:logs_append, data: params.slice(*%w(id log number final)))
        halt 202
      end

      # TODO where should this run, should travis-hub have an http endpoint?
      #      should it just enqueue to rabbit for now? and sidekiq later?
      # TODO needs a proper scope
      # TODO add :error to Job and pass it down
      # TODO should this be patch?
      post '/:id/state' do
        p params.slice(*%w(started_at finished_at state worker error))
        # run_service(:update_job, event: params[:event], data: params.slice(*%w(started_at finished_at state worker)))
        halt 202
      end
    end
  end
end
