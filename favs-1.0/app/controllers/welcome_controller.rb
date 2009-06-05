class WelcomeController < ApplicationController
  
  def index
    redirect_to :action => "welcome"
  end
  
  def terms
  end
  
  def faq
  end
 
  def scheme
  end
  
  def privacy
  end
  
  def welcome
  end
  
  def coming_soon
    render :layout => false
  end
  
  def dot_file
    @subscriptions = Subscription.find(:all)
    render :layout => false
  end
end
