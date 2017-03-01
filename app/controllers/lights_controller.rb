class LightsController < ApplicationController
  def create
    @light = Light.new(light_params)
    if @light.save
      redirect_to magic_light_path
    else
      render 'new'
    end
  end

  def index
    @lights = Light.all
  end

  private

  def light_params
    params.require(:light).permit(:ip_address)
  end
end
