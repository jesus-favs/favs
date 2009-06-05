class VotesController < ApplicationController


  def create
	
  end
  def new
    check= 0
    if @params[:mail]
      vote = Vote.new
      vote.mail = params[:mail]
      vote.post_id = params[:id]
      check = check_vote
logger.debug "check: #{check}"      
      

      if check == 1 or check ==5
	  
          # Send mail to voter
          if check == 1
            name = Feed.find_by_mail(params[:mail]).name
          else
            name = User.find_by_email(params[:mail]).login
          end
          mail = params[:mail]
          post = Post.find_by_id(params[:id]).title

          vote.save 
  	  flash[:notice] = "Vote saved!"
	  Notification.deliver_newvote(name,mail,post)	
	else
          case check
            when 2
              flash[:warning] = "You can't vote for yourself!"
            when 3
              flash[:warning] = "You already voted this post!"
            when 4
              flash[:warning] = "Wrong email. Do you belong this class?"
          end
          redirect_to "http://localhost:3000/votes/new/" + params[:id]
      end
	 
    else
      if params.length > 3
        flash[:notice] = "Please introduce your email"
      end
    end
        
  end




  protected

    def check_vote
    
    
      ## Check that pupil is not voting himself
      feed_id = Post.find_by_id(params[:id]).feed_id	
      if Feed.find_by_id(feed_id).mail == params[:mail]
	return 2
      end	
      ## Check that pupil is not voting a post again
 
      if Vote.count(:conditions => ["mail = ? and post_id = ?",params[:mail],params[:id]]) > 0
	return 3
      end

      ## Check that mail belongs to one of the pupils or the teacher
      
	s = Subscription.find(:first, :conditions => ["feed_id = ?", feed_id])
	user_id = s.user_id

        ##check if teacher is the one who is voting
	if User.find_by_id(user_id).email == params[:mail]
          return 5
        end
        
	subs = []
	subs = Subscription.find(:all, :conditions => ["user_id = ?", user_id])
	subs.each do |s|
	  if s !=nil
		if s.feed != nil
		  if s.feed.mail == params[:mail]
		    return 1
		  end
		end
	  end
	end



        return 4
    end 
end
