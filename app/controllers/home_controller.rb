class HomeController < ApplicationController

  def index
    @containers = Container.by_state
  end

end
