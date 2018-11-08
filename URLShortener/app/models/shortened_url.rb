# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint(8)        not null, primary key
#  long_url   :string           not null
#  short_url  :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord
  validates :user_id, :long_url, presence: true, uniqueness: true
  
  
  def self.random_code
    loop do
      potential_short_url = SecureRandom::urlsafe_base64
      return potential_short_url unless ShortenedUrl.exists?(short_url: potential_short_url)
    end
  end
  
  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'
  
end
