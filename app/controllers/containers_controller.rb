class ContainersController < ApplicationController

  helper_method :container

  def index
    @containers = Container.by_state
    render layout: false
  end

  def new
    @container = Container.new
  end

  def create
    ContainerCreateJob.perform_later params[:container][:name], params[:container][:template]
    redirect_to root_path, notice: 'The container will be created'
  end

  def start
    ContainerStateChangeJob.perform_later container, 'start'
    redirect_to root_path, notice: 'The container has been started'
  end

  def stop
    ContainerStateChangeJob.perform_later container, 'stop'
    redirect_to root_path, notice: 'The container has been stopped'
  end

  def freeze
    ContainerStateChangeJob.perform_later container, 'freeze'
    redirect_to root_path, notice: 'The container has been frozen'
  end

  def unfreeze
    ContainerStateChangeJob.perform_later container, 'unfreeze'
    redirect_to root_path, notice: 'The container has been unfrozen'
  end

  def destroy
    ContainerStateChangeJob.perform_later container, 'destroy'
    redirect_to root_path, notice: 'The container has been destroyed'
  end

  private

  def container
    Container.find(params[:id])
  end

end
