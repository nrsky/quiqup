class TrafficController < ApplicationController

  #TODO async_preload with resque, put into MongoGridFs.
  def index
    data = ParseTrafficService.new.get_disruptions_xml
    #TODO fixture
    @parsed_data = ParseTrafficService.new.parse_traffic_xml data

    #TODO add decorators
    @json_response = []
    @parsed_data.each do |disruption|
      @json_response << disruption.to_json
    end
    puts @json_response


    render(:template => 'layouts/traffic_index')
  end

  #
  # def load_disruptions
  #   data = ParseTrafficService.new.get_disruptions_xml
  #   # @parsed_data = ParseTrafficService.new.parse_traffic_xml data
  #   respond_to do |format|
  #     format.html { render :partial => "traffic/show_traffic.html" }
  #   end
  # end
end