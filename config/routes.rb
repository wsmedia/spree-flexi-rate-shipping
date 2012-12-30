
Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resources :flexi_shipping_rates
  end
end

