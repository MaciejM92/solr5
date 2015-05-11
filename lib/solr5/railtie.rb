require 'solr5'
require 'rails'

module Btp
  class Railtie < Rails::Railtie
    rake_tasks do
      load "tasks/solr5_tasks.rb"
    end
  end
end