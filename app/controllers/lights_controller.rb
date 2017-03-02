require 'socket'
class LightsController < ApplicationController
  def create
    @light = Light.new(light_params)
    if @light.save
      flash[:notice] = 'Light added successfully'
      redirect_to magic_light_path
    else
      flash[:alert] = 'Please make sure your IP is unique.'
      redirect_to magic_light_path
    end
  end

  def index
    @lights = Light.all
  end

  def turnon
    @light = Light.find(params[:id])
    @light.turnon(@light.ip_address)
    flash[:notice] = 'Light turned on'
    redirect_to magic_light_path
  end

  private

  def light_params
    params.require(:light).permit(:ip_address, :id)
  end
end
