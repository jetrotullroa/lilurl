class LinksController < ApplicationController
  def index
    @links = Link.all.order(created_at: :desc)
    @link = Link.new
    @link_latest = Link.last.short_link
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
      redirect_to root_url
      flash[:new_link] =  "#{display_new_short_link(@link.short_link)}"
    else
      render :index
    end
  end

  private

  def link_params
    params.require(:link).permit(:original_link)
  end

end
