require 'nokogiri'
require 'nori'

class ParseTrafficService

  DISRUPTION_API_URL = 'https://data.tfl.gov.uk/tfl/syndication/feeds/tims_feed.xml?app_id=&app_key='

  def get_disruptions_xml
    Net::HTTP.get(URI.parse(DISRUPTION_API_URL))
  end

  def parse_traffic_xml(xml_data)
    doc = Nokogiri::XML.parse(xml_data)
    doc.remove_namespaces!
    doc.xpath('//Disruption').each do  |element|
      create_disruption(element)
    end
  end

  private

  #TODO for time optimizing nori could be used, or any gem xml -> hash, then search in hash
  def create_disruption(element)
    disruption = Disruption.new

    #NOTE in main tag location
    model_fields =  Disruption.fields.keys
    disruption.xml_id = element[:id]
    element.children.each do |child|
      if model_fields.include?(child.name)
        disruption[child.name.to_sym] = child.text
      end
    end
    disruption[:coordinates_EN] = element.xpath('//Point//coordinatesEN').text
    disruption[:coordinates_LL] = element.xpath('//Point//coordinatesLL').text

    #TODO save in DB if we need to save
    disruption.save!
    disruption
  end
end