class CreateCollectionArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :collection_artworks do |t|
      t.integer :artwork_id, null: false
      t.integer :collection_id, null: false
      
      t.timestamps
    end
    add_index :collection_artworks, :artwork_id
    add_index :collection_artworks, :collection_id
  end
end
