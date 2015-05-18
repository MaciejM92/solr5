require 'rails'

module Solr5
  class Railtie < Rails::Railtie
    rake_tasks do
      load "tasks/solr5_tasks.rb"
    end
  end
end