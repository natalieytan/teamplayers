class Team < ApplicationRecord
  include ImageUploader::Attachment.new(:image)
  belongs_to :owner, class_name: 'User'
  belongs_to :sport
  belongs_to :skill
  belongs_to :gender
  belongs_to :day
  geocoded_by :full_street_address 
  after_validation :geocode
  validates :name, presence: true
  validates :description, length: { maximum: 1000 }

  def full_street_address
    "#{street_number} #{route}, #{administrative_area} #{postal_code}, #{country}"
  end
end