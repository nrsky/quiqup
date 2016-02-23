class TrafficController < ApplicationController
  def index
    render(:template => 'layouts/traffic_index')
  end

  def load_disruptions

  end
end