class LightsController < ApplicationController
  def create
    @light = Light.new(light_params)
    @light.save
    @color = Color.new light_id: @light.id, color: "000000"
    @color.save
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
    @light.status = true
    @light.save
    @light.turnon(@light.ip_address)
    flash[:notice] = "Light (#{@light.ip_address}) turned on"
    redirect_to magic_light_path
  end

  def turnoff
    @light = Light.find(params[:id])
    @light.status = false
    @light.save
    @light.turnoff(@light.ip_address)
    flash[:notice] = "Light (#{@light.ip_address}) turned off"
    redirect_to magic_light_path
  end

  def turnoffall
    @light = Light.all
    @light.each do |l|
      l.status = false
       l.save
      l.turnoff(l.ip_address)
    end
    flash[:notice] = 'All Lights turned off'
    redirect_to magic_light_path
  end

  def turnonall
    @light = Light.all
    @light.each do |l|
      l.status = true
      l.save
      l.turnon(l.ip_address)
    end
    flash[:notice] = 'All Lights turned on'
    redirect_to magic_light_path
  end

  private

  def light_params
    params.require(:light).permit(:ip_address, :id)
  end
end
