require 'travis/api/app'

class Travis::Api::App
  class Endpoint
    # TODO: Add documentation.
    class Hooks < Endpoint
      # TODO: Add implementation and documentation.
      # get('/', scope: :private) { raise NotImplementedError }
      get('/') do
        if params[:login] == 'svenfuchs'
          {
            :hooks => [
              {
                :id => 1,
                :slug => "svenfuchs/travis-keychain",
                :description => 'Travis CI keychain',
                :url => "https://github.com/svenfuchs/travis-keychain",
                :active => true
              }
            ]
          }
        else
          {
            :hooks => [
              {
                :id => 2,
                :slug => "travis-ci/travis-ci",
                :description => 'Travis CI',
                :url => "https://github.com/travis-ci/travis-ci",
                :active => false
              }
            ]
          }
        end
      end

      # TODO: Add implementation and documentation.
      put('/:id', scope: :admin) { raise NotImplementedError }
    end
  end
end
