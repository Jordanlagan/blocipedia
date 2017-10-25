class CollaboratorsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    @wiki = Wiki.find_by(id: params[:wiki])

    if @user
      if Collaborator.where(user_id: @user.id, wiki_id: @wiki.id).empty?
        collaborator = Collaborator.new(user_id: @user.id, wiki_id: @wiki.id)
        if collaborator.save
          flash[:notice] = "'#{@user.email}' added as a collaborator."
          redirect_to @wiki
        else
          flash[:notice] = "There was an error adding the collaborator."
          redirect_back(fallback_location: @wiki)
        end
      else
        flash[:alert] = "This user is already collaborating on this wiki."
        redirect_back(fallback_location: @wiki)
      end
    else
      flash[:alert] = "This user doesn't exist"
      redirect_back(fallback_location: @wiki)
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    if @collaborator.destroy
      flash[:notice] = "Collaborator was removed."
      redirect_back(fallback_location: @wiki)
    else
      flash.now[:alert] = "The Collaborator could not be removed."
      redirect_back(fallback_location: @wiki)
    end
  end
end
