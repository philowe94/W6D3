class CollectionsController < ApplicationController


    def index
        if params[:user_id]
            collections = User.find(params[:user_id]).collections
            render json: collections
        else
            collections = Collection.all
            render json: collections
        end
    end

    def show
        collection = Collection.find(params[:id])
        render json: collection
    end

    def create
        collection = Collection.new(collection_params)
        if collection.save
            render json: collection
        else
            render json: collection.error.full_messages, status: :unprocessable_entity
        end
    end

    def delete
         collection = Collection.find(params[:id])
         collection.destroy
         render json: collection
    end

    private
    def collection_params
        params.require(:collection).permit(:user_id, :name)
    end

end