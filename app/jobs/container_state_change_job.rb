class ContainerStateChangeJob < ActiveJob::Base
  queue_as :default

  def perform(container, state)
    container.send(state)
  end
end
