class Profile < ApplicationRecord
  enum gender: { male: 1, female: 2, other: 3, prefer_not_to_disclose: 4 }
  belongs_to :user
  include ImageUploader::Attachment.new(:image)

  def full_name
    "#{first_name} #{last_name}"
  end
end
