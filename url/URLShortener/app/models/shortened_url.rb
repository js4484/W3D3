# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint(8)        not null, primary key
#  long_url   :string
#  short_url  :string
#  creator_id :integer
#

class ShortenedUrl  < ApplicationRecord
    validates :long_url, :short_url, presence: true, uniqueness: true
    

    belongs_to :submitter,
    primary_key: :id,
    foreign_key: :creator_id,
    class_name: :User
    
    has_many :visits,
    primary_key: :id,
    foreign_key: :s_url_id,
    class_name: :Visits


    def num_clicks
        Visit.count(id)
    end

    def num_uniques
        count('id', distinct: true)
    end

    def recent_uniques
        count(where("created_at > ?", 10.minutes.ago), distinct: true)
    end

    def self.shortened_urls(user, long_url)
        ShortenedUrl.create!(creator_id: user.id, long_url: long_url, short_url: self.random_code)
    end

    def self.random_code
        rand = SecureRandom::urlsafe_base64
        while exists?(rand)
            rand = SecureRandom::urlsafe_base64
        end
        rand
    end

end
