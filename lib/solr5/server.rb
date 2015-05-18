module Solr5
  class Server
    def initialize
      @config = YAML.load_file("#{Rails.root}/config/sunspot.yml")[Rails.env]['solr'].symbolize_keys!
      @config.reverse_merge!( hostname: 'localhost', port: 8983 )

      abort "bin must be specified in sunspot.yml for proper use of solr5 gem\nrake aborted!" unless @config.include? :bin
    end

    def method_missing method_name, *args
      if [:start, :stop, :restart].include? method_name
        exec "#{@config[:bin]} #{method_name} -h #{@config[:hostname]} -p #{@config[:port]}"
      else
        super
      end
    end

  end
end