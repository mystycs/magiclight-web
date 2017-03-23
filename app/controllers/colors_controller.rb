class ColorsController < ApplicationController
  def create
    @color = Color.all

    #@color.update_all(params[:color])
    @light = Light.all
    @light.each do |l|
      @color.changecolor(l.ip_address, params[:color][:color])
    end
    flash[:notice] = "Color changed to #{params[:color][:color]}."
    redirect_to magic_light_path
  end

  def warmwhite
    @color = Color.all

    #@color.update_all(:color => "#000000ff")
    @light = Light.all
    @light.each do |l|
      @color.changecolor(l.ip_address, "#000000FF")
    end
    flash[:notice] = "Color changed to warm white(#000000FF)."
    redirect_to magic_light_path
  end

  private

  def color_params
    params.require(:light).permit(:color, :light_id)
  end
end
