class ContainerCreateJob < ActiveJob::Base
  queue_as :default

  def perform(name, template)
    Container.new({
      id: name,
      name: name,
      template: template
    }).save
  rescue => e
    # TODO: we need to suppress the error to prevent from retries but it should be reported somehow.
    puts "[ERROR] #{e.inspect}"
  end
end
