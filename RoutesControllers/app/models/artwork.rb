# == Schema Information
#
# Table name: artworks
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  image_url    :integer          not null
#  artist_id    :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  is_favorite? :boolean          default(FALSE)
#
class Artwork < ApplicationRecord

    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_shares,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

    has_many :comments,
        dependent: :destroy,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Comment

    has_many :likes, as: :likeable,
        foreign_key: :likeable_id,
        class_name: :Like

    has_many :liked_by,
        through: :likes,
        source: :liker    

    # belongs_to :favorited_by, -> { where is_favorite?: true },
    # foreign_key: :artist_id,
    # class_name: :User

    validates :title, presence: true
    validates :image_url, presence: true
    validates :artist_id, presence: true

    validates :title, uniqueness: true
    validates :image_url, uniqueness: true
    validates :artist_id, uniqueness: true
end
