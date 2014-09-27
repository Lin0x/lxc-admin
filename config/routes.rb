Rails.application.routes.draw do

  root to: 'home#index'

  get 'containers/index', to: 'containers#index', as: :containers
  get 'containers/new',   to: 'containers#new',   as: :new_container

  post 'containers/index', to: 'containers#create'

  patch 'containers/:id/start',    to: 'containers#start',    as: :start_container
  patch 'containers/:id/stop',     to: 'containers#stop',     as: :stop_container
  patch 'containers/:id/freeze',   to: 'containers#freeze',   as: :freeze_container
  patch 'containers/:id/unfreeze', to: 'containers#unfreeze', as: :unfreeze_container

  delete 'containers/:id', to: 'containers#destroy', as: :destroy_container

end
