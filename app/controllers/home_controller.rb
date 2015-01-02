class HomeController < ApplicationController

  def index
    @system = SystemInfo.find
    @containers = Container.by_state
  end

end
