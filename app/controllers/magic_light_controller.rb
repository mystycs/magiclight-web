class MagicLightController < ApplicationController
  def index
    @light = Light.new
    @lights = Light.all
    @color = Color.new
    @colors = Color.all
  end
end
