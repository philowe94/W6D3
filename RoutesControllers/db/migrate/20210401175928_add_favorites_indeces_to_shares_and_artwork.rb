class AddFavoritesIndecesToSharesAndArtwork < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :is_favorite?, :boolean, default: false
    add_column :artwork_shares, :is_favorite?, :boolean, default: false
  end
end
