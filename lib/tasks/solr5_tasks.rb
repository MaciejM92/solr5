namespace :solr5 do
  namespace :server do
    desc 'Start solr5 server'
    task :start do
      Solr5::Server.new.start
    end

    desc 'Restart solr5 server'
    task :restart do
      Solr5::Server.new.restart
    end

    desc 'Stop solr5 server'
    task :stop do
      Solr5::Server.new.stop
    end
  end

  namespace :core do
    desc 'Create solr5 core'
    task :create do
      Solr5::Core.new.create
    end

    desc 'Delete solr5 core'
    task :delete do
      Solr5::Core.new.delete
    end
  end
end