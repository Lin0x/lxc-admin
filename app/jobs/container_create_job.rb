class ContainerCreateJob < ActiveJob::Base
  queue_as :default

  def perform(name, template)
    Container.new({
      id: name,
      name: name,
      template: template
    }).create
  end
end
