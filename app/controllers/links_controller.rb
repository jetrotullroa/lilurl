class LinksController < ApplicationController
  def index
    @links = Link.all.order(created_at: :desc)
    @link = Link.new
  end

  def show
    @link = Link.find_by(short_link: params[:short_link])
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

  private

  def link_params
    params.require(:link).permit(:original_link)
  end

end
