class ContainerStateChangeJob < ActiveJob::Base
  queue_as :default

  def perform(container, state)
    container.send(state)
  rescue => e
    # TODO: we need to suppress the error to prevent from retries but it should be reported somehow.
    puts "[ERROR] #{e.inspect}"
  end
end
