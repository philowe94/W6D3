class CollectionArtworksController < ApplicationController

    def index
        collection_artworks = CollectionArtwork.all
        render json: collection_artworks
    end

    def create
        collection_artwork = CollectionArtwork.new(collection_artwork_params)
        if collection_artwork.save
            render json: collection_artwork
        else
            render json: collection_artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        collection_artwork = CollectionArtwork.find(params[:id])
        collection_artwork.destroy
        render json: collection_artwork
    end

    private
    def collection_artwork_params
        params.require(:collection_artwork).permit(:artwork_id, :collection_id)
    end
end