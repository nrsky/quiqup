Rails.application.routes.draw do
  root 'traffic#index'
  get 'traffic/load_disruptions'  => 'traffic#load_disruptions', :as => :traffic_load_disruptions
end
