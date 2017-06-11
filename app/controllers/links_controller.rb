class LinksController < ApplicationController
  def index
    @links = Link.all.order(created_at: :desc)
    @link = Link.new
  end

  def show
    @link = Link.find(params[:id])
    redirect_to @link.original_link
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to root_url, notice: "Your link was successfully created."
    else
      render :index
    end
  end

  def edit
  end

  def update
  end

  def delete
  end


  private

  def link_params
    params.require(:link).permit(:original_link)
  end

end
