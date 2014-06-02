class FeedsController < ApplicationController

  def index
    @observations = Observation.where(:feed_id => params[:fid])
    @feed = Feed.find(params[:fid])
    @following = Followers.where(:user_id => @feed.user_id)
    @followers = Followers.where(:feed_id => @feed.id)
    if current_user
      @current_user_feed = Feed.where(:user_id => current_user.id)
      is_following = Followers.where(:feed_id => @feed.id, :user_id => current_user.id)
      if is_following.count > 0
        @is_current_user_following = true;
      else
        @is_current_user_following = false;
      end
    end
  end
  
  def follow
    if current_user
      new_follow = Followers.new(:feed_id => params[:fid], :user_id => current_user.id)
      if new_follow.save
        redirect_to :controller => 'feeds', :action => 'index', :fid => params[:fid]
      else
      #TODO some kind of error handling
      end
    else  
      #TODO some kind of error handling
    end
  end

end
