class ColorsController < ApplicationController

  def create
    @color = Color.all
    @color.update_all(params[:color])
    @light = Light.all
    @light.each do |l|
      @color.changecolor(l.ip_address, params[:color][:color].to_s )
    end
    flash[:notice] = "Color changed to ##{params[:color][:color]}."
    redirect_to magic_light_path

  end

  private

  def color_params
    params.require(:light).permit(:color, :light_id)
  end
end
