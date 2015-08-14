module Solr5
  class Server
    def initialize
      @config = YAML.load_file("#{Rails.root}/config/sunspot.yml")[Rails.env]['solr'].symbolize_keys!
      @config.reverse_merge!( hostname: 'localhost', port: 8983 )

      abort "bin must be specified in sunspot.yml for proper use of solr5 gem\nrake aborted!" unless @config.include? :bin
    end

    def method_missing method_name, *args
      if method_name == :restart
        system("diff #{@config[:configset]}/conf #{@config[:bin].split('/')[0..-3].join('/')}/server#{@config[:path]}/conf 1>/dev/null 2>/dev/null")
        if $? != 0
          system('echo Warning: config files differ between project and solr server. Run rake solr5:core:update to update config files.')
        end
      end
      if [:start, :stop, :restart].include? method_name
        exec "#{@config[:bin]} #{method_name} -h #{@config[:hostname]} -p #{@config[:port]}"
      else
        super
      end
    end

  end
end