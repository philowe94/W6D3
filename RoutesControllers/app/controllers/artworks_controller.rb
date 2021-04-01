class ArtworksController < ApplicationController
    def index
        if params[:user_id]
            artworks = User.find(params[:user_id]).artworks
            artworks += User.find(params[:user_id]).shared_artworks 
            render json: artworks
        elsif params[:collection_id]
            artworks = Collection.find(params[:collection_id]).artworks
            render json: artworks
        else
            artworks = Artwork.all
            render json: artworks
        end
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end
    
    def show
        artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy
        render json: artwork
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id, :is_favorite?)
    end

end