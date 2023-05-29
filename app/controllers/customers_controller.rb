class CustomersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @customers = retrieve_customers_from_crm
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path, notice: 'Customer was successfully created.'
    else
      render :new
    end
  end

def edit
  @customer = Customer.find(params[:id])
end


  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customers_path, notice: 'Customer was successfully updated.'
    else
      render :edit
    end
  end

def destroy
  @customer = Customer.find(params[:id])
  @customer.destroy
  redirect_to customers_path, notice: 'Customer was successfully deleted.'
end



  private

def retrieve_customers_from_crm
  @customers = Customer.all
end


def customer_params
  params.require(:customer).permit(:name, :phone, :email, :address, :secondary_phone, :fax, :social_media_profiles, :company_name, :position, :department, :gender, :nationality, :notes)
end

end
