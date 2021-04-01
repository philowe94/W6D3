# == Schema Information
#
# Table name: collections
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Collection < ApplicationRecord

    belongs_to :user,
    foreign_key: :user_id,
    class_name: :User

    has_many :collection_artworks,
    foreign_key: :collection_id,
    class_name: :CollectionArtwork

    has_many :artworks,
    through: :collection_artworks,
    source: :artwork




end
