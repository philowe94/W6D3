# == Schema Information
#
# Table name: collection_artworks
#
#  id            :bigint           not null, primary key
#  artwork_id    :integer          not null
#  collection_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class CollectionArtwork < ApplicationRecord

belongs_to :collection,
foreign_key: :collection_id,
class_name: :Collection

belongs_to :artwork,
foreign_key: :artwork_id,
class_name: :Artwork


end

