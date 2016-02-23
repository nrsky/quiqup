class TrafficController < ApplicationController
  def index
    data = ParseTrafficService.new.get_disruptions_xml
    # @parsed_data = ParseTrafficService.new.parse_traffic_xml data
    respond_to do |format|
      format.html { render :partial => "traffic/show_traffic.html" }
    end
  end

  def load_disruptions
    data = ParseTrafficService.new.get_disruptions_xml
    # @parsed_data = ParseTrafficService.new.parse_traffic_xml data
    respond_to do |format|
      format.html { render :partial => "traffic/show_traffic.html" }
    end
  end
end