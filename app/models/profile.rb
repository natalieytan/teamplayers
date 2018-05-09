class Profile < ApplicationRecord
  enum gender: { male: 1, female: 2, other: 3, prefer_not_to_disclose: 4 }
  belongs_to :user
  include ImageUploader::Attachment.new(:image)
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :gender, presence: true
  validates :description, length: { maximum: 500 }
  validates :postcode, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :country, presence: true
  geocoded_by :playing_location   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  def playing_location
    "#{city}, #{state} #{postcode} #{country}"
  end

  def simple_location
    "#{city}, #{state}, #{country}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def not_modified?
    created_at == updated_at
  end
end
