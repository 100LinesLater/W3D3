# == Schema Information
#
# Table name: shortened_urls
#
#  id        :bigint(8)        not null, primary key
#  long_url  :string           not null
#  short_url :string
#  user_id   :integer
#

class ShortenedUrl < ApplicationRecord
    # validates :long_url, presence: true
    # validates :short_url, presence: true, uniqueness: true
    
    def self.random_code
        var = SecureRandom.urlsafe_base64
        while self.exists?(var)
            var = SecureRandom.urlsafe_base64
        end
        var
    end

    def self.create_new!(user, long_url)
        self.new(long_url: long_url, short_url: self.random_code, user_id: user.id )
    end
    
end
