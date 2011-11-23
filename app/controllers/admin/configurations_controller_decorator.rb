module Admin
  ConfigurationsController.class_eval do
    before_filter :add_flexi_rate_links, :only => :index

    def add_flexi_rate_links
      @extension_links << {
        :link => admin_flexi_shipping_rates_path,
        :link_text => FlexiShippingRate.human_name(:count => 2),
        :description => t('flexi_shipping_rates_description')
      }
    end
  end
end

