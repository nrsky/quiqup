require 'rails_helper'

describe ParseTrafficService do
  it '#get_disruptions_xml' do
    #TODO stub web req
    # expect(ParseTrafficService.new.get_disruptions_xml).not_to be_empty
  end

  it '#parse_traffic_xml' do
    xml_data = File.read(File.join(Rails.root, 'spec', 'fixtures', 'traffic_disruptions.xml'))
    ParseTrafficService.new.parse_traffic_xml(xml_data)
  end
end