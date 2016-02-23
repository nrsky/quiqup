class Disruption
  include Mongoid::Document

  #TODO field naming layer
  field :xml_id, type: String
  field :status, type: String
  field :severity, type: String
  field :levelOfInterest, type: String
  field :subCategory, type: String
  field :startTime, type: DateTime
  field :endTime, type: DateTime
  field :location,  type: String
  field :corridor,  type: String
  field :comments,  type: String
  field :currentUpdate,  type: String
  field :remarkTime, type: DateTime
  field :lastModTime, type: DateTime

  #TODO
  field :coordinates_EN, type: String
  field :coordinates_LL, type: String

  # embeds_many :display_points
  validates :xml_id, presence: true
end
