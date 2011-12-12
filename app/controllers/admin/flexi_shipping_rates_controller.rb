class Admin::FlexiShippingRatesController < Admin::BaseController    
  before_filter :load_data
  helper_method :edit_object_url, :object_url, :collection_url

  respond_to :html

  def index
    @flexi_shipping_rates = FlexiShippingRate.all
    respond_with(@flexi_shipping_rates)
  end

  def new
    @flexi_shipping_rate = FlexiShippingRate.new
  end

  def edit
    @flexi_shipping_rate = FlexiShippingRate.find params[:id]
  end

  def create
    @flexi_shipping_rate = FlexiShippingRate.new params[:flexi_shipping_rate]
    if @flexi_shipping_rate.save
      redirect_to collection_url, :notice => 'Shipping Rate created'
    else
      render :new
    end
  end

  def update
    @flexi_shipping_rate = FlexiShippingRate.find params[:id]
    if @flexi_shipping_rate.update_attributes params[:flexi_shipping_rate]
      redirect_to collection_url, :notice => 'Shipping Rate update'
    else
      render :edit
    end
  end

  def destroy
    @flexi_shipping_rate = FlexiShippingRate.find params[:id]
    @flexi_shipping_rate.destroy
    redirect_to collection_url, :notice => 'Shipping Rate removed'
  end

private 
  def load_data     
    @available_categories = ShippingCategory.find :all, :order => :name
    @available_zones = Zone.find :all, :order => :name
  end

  def edit_object_url(object)
    edit_admin_flexi_shipping_rate_url(object)
  end

  def object_url(object)
    admin_flexi_shipping_rate_url(object)
  end

  def collection_url
    admin_flexi_shipping_rates_url
  end
end

