class Spree::Calculator::FlexiShippingRate < Spree::Calculator
  def self.description
    I18n.t("flexible_rate") + " - Categories"
  end

  def self.available?(object)
    sc = object.line_items.map {|li| li.product.shipping_category}
    return false if sc.any? {|c| c.nil?}
    return true
  end

  def self.register
    super
    Spree::ShippingMethod.register_calculator(self)
  end

  def compute(object)
    rates = {}
    rate_count = {}
      binding.pry
      #return false if object.nil?
    return 0 if object.class == Spree::Order && object.total > 95 # Make the delivery free
    object.line_items.each do |li|
      li.quantity.times do
        sc = li.product.shipping_category
        return false if sc.nil?
        flexi_rates = sc.flexi_shipping_rates
          fsr = flexi_rates.detect { |rate| rate.zone.include?(ship_address = (object.class == Spree::Shipment) ? object.order.ship_address : object.ship_address) }
        rate_count[fsr.id] = 0 unless rate_count.has_key?(fsr.id)
        rate_count[fsr.id] += 1
        rates[fsr.id] = 0 unless rates.has_key?(fsr.id)

        if rates[fsr.id] == 0
          rates[fsr.id] += fsr.first_item_price
        else
          if rate_count[fsr.id] % fsr.max_items == 1
            rates[fsr.id] += fsr.first_item_price
          else
            rates[fsr.id] += fsr.additional_item_price
          end
        end
      end
    end
    return rates.values.inject(0) { |sum, c| sum + c }
  end
end
