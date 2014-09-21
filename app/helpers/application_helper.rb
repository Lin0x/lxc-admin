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

  def action_button(action, container)
    link_to send("#{action}_container_path", container.id), class: "btn btn-xs btn-#{action_class(action)}" + (disabled?(action, container.state) ? " disabled" : ""), method: action_method(action) do
      content_tag(:span, '', class: "glyphicon glyphicon-#{action_icon(action)}") + " #{action.capitalize}"
    end
  end

  private

  def disabled?(action, state)
    disabled = false
    disabled = true if action == :start    && [:running, :frozen ].include?(state)
    disabled = true if action == :stop     && [:stopped, :frozen ].include?(state)
    disabled = true if action == :freeze   && [:stopped, :frozen ].include?(state)
    disabled = true if action == :unfreeze && [:running, :stopped].include?(state)
    disabled = true if action == :destroy  && [:running, :frozen ].include?(state)
    disabled
  end

  def state_class(state)
    {
      running: 'success',
      stopped: 'danger',
      frozen:  'info'
    }.fetch(state, '')
  end

  def action_class(action)
    { destroy: 'danger' }.fetch(action, 'default')
  end

  def action_icon(action)
    {
      start:     'play',
      stop:      'stop',
      freeze:    'pause',
      unfreeze:  'step-forward',
      destroy:   'trash'
    }.fetch(action, '')
  end

  def action_method(action)
    { destroy: :delete }.fetch(action, :patch)
  end

end
