class SubscriptionsController < ApplicationController

  def new
    if params[:mail] and params[:blog] and params[:name]
      
      
        
     
          begin
            # Create or find a feed using specified blog url
	    pupils_name = params[:name]
	    mail = params[:mail]
            blog = params[:blog]	
	    feed = Feed.create_from_blog(blog,pupils_name,mail)
            flash[:message] = "Your blog has been joined to your class"
            user = User.find_by_id(params[:id])
            if user.add_subscription(feed).nil?
              flash[:message] = "This blog already belongs to your class"
            end
          rescue => err
            flash[:warning] = "A problem occured with your blog: #{err.message}"
          end
        
      @subscriptions = user.just_added_subscriptions
      # Do not select avatar if nothing to select
      if not @subscriptions.detect{ |sub| sub.feed.avatar_locked == 1 }.nil?
        user.subscriptions_added
        flash[:notice] = "Your blog has been joined to your class"	
      else
      #      #render :action => 'select_avatars'	
      end
    end
  end

  def select_avatars
  
  end

  
  def avatar_selected
    user =  User.find_by_id(params[:id])
    user.subscriptions_added
    
    redirect_to :action => 'index'
  end
  
  
  ###
  # RJS actions
  ###


  def select_avatar
    
    @update_avatar = params[:update_avatar]
    @subscription = Subscription.find(params[:id])
    @subscription.update_attribute :avatar_id, params[:avatar_id]
  end

  def change_avatar
    
    @headers["Content-Type"] = "text/javascript"
    @subscription = Subscription.find params[:id]
  end

  def upload_avatar
    
    @subscription = Subscription.find params[:subscription][:id]
    filename = @params[:subscription][:picture].original_filename

    if @params[:subscription][:picture] and not @params[:subscription][:picture] == "" and
      not @params[:subscription][:picture].original_filename.empty?
      if not @params[:subscription][:picture].content_type.chomp =~ /^image/
        flash[:warning] = "Your picture isn't an image !" 
        return false
      else

        tempfile = Tempfile.new('tmp')
        tempfile.write @params[:subscription][:picture].read
        tempfile.flush
        
        # Guess file format
        @params[:subscription][:picture].content_type.scan(/\/(.*)$/)
        
        avatar = Avatar.create_from_file tempfile, $1.strip
        if avatar.nil?
          flash[:warning] = "A problem occured during avatar upload"
        else
          @subscription.update_attribute(:avatar_id, avatar.id)
        end
      end
    end  
    redirect_to :action => 'index'
  end

  






end
