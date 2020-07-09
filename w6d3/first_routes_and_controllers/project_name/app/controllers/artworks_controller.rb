class ArtworksController < ApplicationController

    def index
        if params[:user_id]
            artist = User.find(params[:user_id])
            artworks = artist.artworks
            artworks += artist.shared_artworks
        else
            artworks = User.all
            
        end
        render json: artworks 
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save #runs model level violation, should return false
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
            redirect_to "/artworks/#{artwork.id}"
        else
            render json: artwork.errors.full_messages, status: 422
        end
    end
    
    def destroy
        artwork = Artwork.find(params[:id])
        if artwork.destroy
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
    
end


