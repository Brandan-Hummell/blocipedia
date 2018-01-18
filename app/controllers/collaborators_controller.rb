class CollaboratorsController < ApplicationController

    def new
        @collaborator = Collaborator.new
    end 

    def create
        @wiki = Wiki.find(params[:wiki_id])
        @user = User.find_by_email(params[:collaborator])
        @collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: @user.id)

        if @collaborator.save
            flash[:notice] = "Collaborator added"
        else 
            flash[:notice] = "Could not find collaborator"
        end

        redirect_to edit_wiki_path(@wiki)
    end 

    def destroy
        wiki = Wiki.find(params[:wiki_id])
        collaborator = Collaborator.find(params[:id])

        if collaborator.destroy
            flash[:notice] = "Collaborator removed"
        else
            flash[:notice] = "Failed to remove collaborator"
        end

        redirect_to edit_wiki_path(wiki)
    end 

    private

    def collaborator_params
        params.require(:collaborator).permit(:wiki_id, :collaborator)
    end
end