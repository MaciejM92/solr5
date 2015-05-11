require "solr5/version"
require "solr5/railtie" if defined? ::Rails::Railtie

module Solr5
  def self.initialize!
    config = YAML.load_file("#{Rails.root}/config/sunspot.yml")[Rails.env]['solr'].symbolize_keys!

    [:path, :bin, :configset].each do |required|
      abort "#{required} must be specified in sunspot.yml for proper use of solr5 gem\nrake aborted!" unless config.include? required
    end

    config.reverse_merge( hostname: 'localhost', port: 8983 )
  end
end
