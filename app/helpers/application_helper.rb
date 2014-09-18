module ApplicationHelper

  def project_name
    "LXC Admin"
  end

  def container_row(container)
    content_tag :tr, class: state_class(container.state) do
      yield
    end
  end

  def state_label(container)
    content_tag :span, container.state, class: "label label-#{state_class(container.state)}"
  end

  private

  def state_class(state)
    {
      running: 'success',
      stopped: 'danger',
      frozen:  'info'
    }.fetch(state, '')
  end

end
