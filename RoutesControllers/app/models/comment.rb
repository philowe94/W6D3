# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  artwork_id :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord

    belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

    belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork

    # has_many :likes,
    # primary_key: :id,
    # foreign_key: :like_id
    # class_name: :Likes

    has_many :likes, as: :likeable,
        foreign_key: :likeable_id,
        class_name: :Like

    has_many :liked_by,
        through: :likes,
        source: :liker
    
end
