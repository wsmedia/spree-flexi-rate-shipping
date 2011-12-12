Deface::Override.new(:virtual_path => "admin/configurations/index",
                     :name => "flexi_rate_configuration",
                     :insert_bottom => 'tbody[data-hook="admin_configurations_menu"]',
                     :partial => 'admin/flexi_shipping_rates/configuration_menu'
                    )
