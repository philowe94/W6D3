# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord

    has_many :artworks, 
        dependent: :destroy,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :Artwork

    has_many :artwork_shares,
        dependent: :destroy,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare

    has_many :shared_artworks,
        through: :artwork_shares,
        source: :artwork

    has_many :comments,
        dependent: :destroy,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :Comment

    has_many :likes,
        foreign_key: :liker_id,
        class_name: :Like

    has_many :liked_comments,
        through: :likes,
        source: :likeable,
        source_type: 'Comment'
    
    has_many :liked_artworks,
        through: :likes,
        source: :likeable,
        source_type: 'Artwork'

    has_many :favorites, -> { where is_favorite?: true },
        foreign_key: :artist_id,
        class_name: :Artwork

    validates :username, presence: true
    validates :username, uniqueness: true
end
