module Solr5
  class Core
    def initialize
      @config = YAML.load_file("#{Rails.root}/config/sunspot.yml")[Rails.env]['solr'].symbolize_keys!
      @config.reverse_merge!( hostname: 'localhost', port: 8983 )

      [:path, :bin, :configset].each do |required|
        abort "#{required} must be specified in sunspot.yml for proper use of solr5 gem\nrake aborted!" unless @config.include? required
      end
    end

    def create
      exec "#{@config[:bin]} create -c #{@config[:path].split('/').last} -p #{@config[:port]} -d #{@config[:configset]}"
    end

    def delete
      exec "#{@config[:bin]} delete -c #{@config[:path].split('/').last} -p #{@config[:port]}"
    end
  end
end