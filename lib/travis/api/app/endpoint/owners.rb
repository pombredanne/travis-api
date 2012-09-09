require 'travis/api/app'

class Travis::Api::App
  class Endpoint
    class Owners < Endpoint
      # TODO should be profile/owners, but ember-data seems to be too stupid for that
      # TODO should be private
      get('/') do
        {
          :owners => [
            { :type => 'user', :login => 'svenfuchs', :name => 'Sven Fuchs', :repos_count => 94 },
            { :type => 'org', :login => 'travis-ci', :name => 'Travis CI', :repos_count => 32 }
          ]
        }
      end
    end
  end
end

