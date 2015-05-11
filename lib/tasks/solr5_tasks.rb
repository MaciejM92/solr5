config = Solr5.initialize!

namespace :solr5 do
  namespace :server do
    desc 'Start solr5 server'
    task :start do
      exec "#{config[:bin]} start -h #{config[:hostname]} -p #{config[:port]}"
    end

    desc 'Restart solr5 server'
    task :restart do
      exec "#{config[:bin]} restart -h #{config[:hostname]} -p #{config[:port]}"
    end

    desc 'Stop solr5 server'
    task :stop do
      exec "#{config[:bin]} stop -h #{config[:hostname]} -p #{config[:port]}"
    end
  end

  namespace :core do
    desc 'Create solr5 core'
    task :create do
      exec "#{config[:bin]} create -c #{config[:path].split('/').last} -p #{config[:port]} -d #{config[:configset]}"
    end

    desc 'Delete solr5 core'
    task :delete do
      exec "#{config[:bin]} delete -c #{config[:path].split('/').last} -p #{config[:port]}"
    end
  end
end