class HomeController < ApplicationController
  
  before_action only: [:new, :edit, :update, :destroy, :create]  
  before_action :authenticate_user!, except: [:index]
 
  def index
    @places = Place.all
    @votes = Vote.all.where(vote_flag: true).group(:votable_id).count.sort_by { |k, v| v }.reverse!
    @spot = []
    @votes.each do |id, v|
      @spot << Place.find(id)
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
  end

  def update
    @place = Place.find(params[:id]) 
      if @place.user_id == current_user.id
    @place.title = params[:title]
    @place.content = params[:content]
    @place.map = params[:map]
    @place.month = params[:month]
    @place.ampm = params[:ampm]
    @place.time = params[:time]
    @place.save
  
  end
    redirect_to '/home'
  end

  def edit
    @place = Place.find(params[:id])
    @place.save
  end

  def create
    @place = Place.new
    puts @place
    @place.title = params[:title]
    @place.content = params[:content]
    @place.map = params[:map]
    @place.month = params[:month]
    @place.ampm = params[:ampm]
    @place.time = params[:time]
    @place.user_id = current_user.id
    @place.avatar = params[:avatar]
    @place.save
    
    redirect_to '/'
  end
  
  def like
    @place = Place.find(params[:id])
  
    if ((current_user.voted_up_on? @place) == false)
      @place.upvote_by current_user
      redirect_to "/home/show/#{@place.id}"
    else
      @place.unliked_by current_user
      redirect_to "/home/show/#{@place.id}"
    end
  end
   
  def dislike
    @place = Place.find(params[:id])
      
    if ((current_user.voted_down_on? @place) == false)
      @place.downvote_from current_user
     redirect_to "/home/show/#{@place.id}"
    else
      @place.unliked_by current_user    
      redirect_to "/home/show/#{@place.id}"
    end
  end

  def destroy
    @place = Place.find(params[:id])
    if @place.user_id == current_user.id
      @place.destroy
    end
    redirect_to "/home/index"
  end
  
  def comment
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.place_id = params[:place_id]
    @comment.msg = params[:comment]
    @comment.save
    redirect_to :back
  end
  
  def comment_delete
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
    end
    redirect_to :back
  end
  
end
