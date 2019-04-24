# == Schema Information
#
# Table name: visits
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer
#  s_url_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#




class Visit < ApplicationRecord

    belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User


    belongs_to :shortened_url,
    primary_key: :id,
    foreign_key: :s_url_id,
    class_name: :ShortenedUrl

end
