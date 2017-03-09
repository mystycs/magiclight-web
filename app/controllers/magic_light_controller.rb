class MagicLightController < ApplicationController
  def index
    @light = Light.new
    @lights = Light.all
    @color = Color.new
    #@colors = Color.all
    @colors = []


    @lights.each do |l|
      @colors.push(Color.getcolor(l.ip_address))
    end
  end
end
