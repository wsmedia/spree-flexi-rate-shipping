module Spree
  module FlexiRateShipping
    class Engine < Rails::Engine
      engine_name 'spree_flexi_rate_shipping'

      config.autoload_paths += %W(#{config.root}/lib)
      
      # use rspec for tests
      config.generators do |g|
        g.test_framework :rspec
      end
      
      def self.activate
        Dir.glob(File.join(File.dirname(__FILE__), "../../../app/**/*_decorator.rb")) do |c|
          Rails.application.config.cache_classes ? require(c) : load(c)
        end

        Dir.glob(File.join(File.dirname(__FILE__), "../../../app/overrides/**/*.rb")) do |c|
          Rails.application.config.cache_classes ? require(c) : load(c)
        end
      end

      initializer "spree.register.flexi_rate_shipping_calculator" do |app|
        app.config.spree.calculators.shipping_methods << Calculator::FlexiShippingRate
      end

      config.to_prepare &method(:activate).to_proc
    end
  end
end

