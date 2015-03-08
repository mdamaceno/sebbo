class AddressController < ApplicationController
  before_filter :find_model

  def create

  end

  def update
    if @user.update(user_params)
    else
    end
  end

  private
  def set_address
    @address ||= Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:field1, :field2, :field3, :field4,
      :city, :state, :zipcode, :user_id)
  end
end
