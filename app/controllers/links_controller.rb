class LinksController < ApplicationController
  before_action :authenticate_user!, only: [:show]


  def index
    @links = Link.all.order(created_at: :desc)
    @link = Link.new

    @my_links = Link.all.where( user_id: current_user ).order( created_at: :desc)

    unless @links.count == 0
      @link_latest = Link.last.short_link
    end
  end

  def show
    @link = Link.find_by(short_link: params[:short_link])
    if redirect_to @link.original_link
      @link.visit_count += 1
      @link.visitor << current_user.id
      @link.save
    end
  end

  def new
    @link = Link.new
  end

  def create
    if user_signed_in?
      @link = current_user.links.new(link_params)
    else
      @link = Link.new(link_params)
    end


    if @link.save
      flash[:new_link] =  "#{display_new_short_link(@link.short_link)}"
      flash[:notice] = "Shortened link has successfully created"
      redirect_to root_url
    else
      render :index
    end
  end

  private

  def display_new_short_link(short_link)
    request.local? ? "#{request.host}:#{request.port}/#{short_link}" : "#{request.host}/#{short_link}"
  end

  def link_params
    params.require(:link).permit(:original_link)
  end

end
