class League < ApplicationRecord
  belongs_to :sport
  belongs_to :organisation
  belongs_to :gender
  belongs_to :skill
  belongs_to :day

  geocoded_by :full_street_address 
  after_validation :geocode

  def full_street_address
    "#{street_number} #{route} #{administrative_area} #{postal_code} #{country}"
  end

end
