class ReportController < ApplicationController
  require 'fastercsv'
  def users
    @user = User.find(params[:id])
    
    @blogs = @user.generate_stats_blogs(params[:tags])
    
    stream_csv do |csv|
      csv << ["student","mail","votes_received", "votes_cast" ]
      @blogs.each do |u|
        csv << [u [:pupil],u [:mail],u [:votes], u[:votes_cast]]
      end

    end

  end
  def blogs
    @user = User.find(params[:id])
    @blogs = @user.generate_stats_blogs(params[:tags])
    
    stream_csv do |csv|
      csv << ["student","votes"]
      @pupils.each do |u|
        csv << [u [:name],u [:votes]]
      end
    end

  end



  private
    def stream_csv
       filename = params[:action] + ".csv"    
	
       #this is required if you want this to work with IE		
       if request.env['HTTP_USER_AGENT'] =~ /msie/i
         headers['Pragma'] = 'public'
         headers["Content-type"] = "text/plain"
         headers['Cache-Control'] = 'no-cache, must-revalidate, post-check=0, pre-check=0'
         headers['Content-Disposition'] = "attachment; filename=\"#{filename}\""
         headers['Expires'] = "0"
       else
         headers["Content-Type"] ||= 'text/csv'
         headers["Content-Disposition"] = "attachment; filename=\"#{filename}\"" 
       end
 
      render :text => Proc.new { |response, output|
        csv = FasterCSV.new(output, :row_sep => "\r\n") 
        yield csv
      }
    end

end
