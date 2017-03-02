class MagicLightController < ApplicationController
  def index
    @light = Light.new
    @lights = Light.all
  end
end
