require 'rails_helper'

describe TrafficController, :type => :controller do
  it 'index responds successfully' do
    get :index
    expect(response.status).to eq(200)
  end

  it 'load_disruptions expect some data to be load' do
    get :load_disruptions
    expect(response.status).to eq(200)
  end
end