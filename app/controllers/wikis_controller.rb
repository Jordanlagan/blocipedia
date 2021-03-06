class WikisController < ApplicationController
after_action :verify_authorized, except: [:index]

  def index
    @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.friendly.find(params[:id])
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]
    @wiki.user = current_user

    authorize @wiki
    if @wiki.save

      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the Wiki."
      render :new
    end
  end

  def edit
    @wiki = Wiki.friendly.friendly.find(params[:id])
    authorize @wiki
  end

  def update
    @wiki = Wiki.friendly.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]

    authorize @wiki
    if @wiki.save

      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the Wiki."
      render :edit

    end
  end

  def destroy
    @wiki = Wiki.friendly.find(params[:id])

    authorize @wiki
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted."
      redirect_to wikis_path
    else
      flash.now[:alert] = "The Wiki could not be deleted."
      render :show
    end
  end
end
