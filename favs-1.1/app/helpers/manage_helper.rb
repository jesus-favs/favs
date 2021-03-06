module ManageHelper
  
  # Method to build the Ajax link to display and select an avatar
  def avatar_display(avatar_id, subscription)
    avatar = Avatar.find avatar_id
    # We set the selected classname if avatar correspond to subscription avatar
    if !avatar.nil? && subscription.avatar == avatar then
      link_to_remote(image_tag("#{avatar.url}"),
          {:url => {:action => "select_avatar", 
                    :id => subscription.id, 
                    :avatar_id => avatar.id, 
                    :update_avatar => "#{avatar_id}_#{subscription.id}"}},
          {:id => "#{avatar_id}_#{subscription.id}", :class => "avatar_#{subscription.id} selected_avatar"})
    else
      link_to_remote(image_tag("#{avatar.url}"),
          {:url => {:action => "select_avatar", 
                    :id => subscription.id, 
                    :avatar_id => avatar.id,
                    :update_avatar => "#{avatar_id}_#{subscription.id}"}},
          {:id => "#{avatar_id}_#{subscription.id}", :class => "avatar_#{subscription.id}"})
    end
  end
  
  def select_display_feevy(user)
    user_sub = user.subscriptions.size
    current_option = user.opt_displayed_subscriptions || 0
    selected = ""
    
    # Begin selection form
    result = "<select name='display_feevy' id='display_feevy'>"
    
    # Display all values
    result << option_display_feevy("last",
                                   "last",
                                   current_option == "last")
    
    # List all possible values from n to 1
    #user_sub.times do 
     # result << option_display_feevy(user_sub, 
      #                               "#{user_sub}",
       #                              user_sub.to_s == current_option)
      #user_sub = user_sub - 1
    #end
    result << option_display_feevy("every","every","every" == current_option)	
    
    result << "</select>"
  end
  
  def option_display_feevy(value, string, selected)
    selection = ""
    selection = "SELECTED" if selected == true
    "<option value='#{value}' #{selection}>#{string}</option>"
  end
  
  def select_lang(current)
#    lang = [["en-EN",   "English"],
#            ["eo-EO",   "Esperanto"], 
#            ["es-AR",   "Espa&ntilde;ol (de t&uacute;)"], 
#            ["es-ES",   "Espa&ntilde;ol (de vos)"],
#	          ["es-UST",  "Espa&ntilde;ol (de usted)"],
#            ["es-CAT",  "Catal&agrave"],
#            ["eu-BA",   "Euskara"],
#            ["fr-FR",   "Fran&ccedil;ais"],
#            ["pt-PT",   "Portugu&ecirc;s"]]

	lang = [["en-EN",   "English"],
		["es-AR",   "Espa&ntilde;ol "]] # de tú
            
    select = "Choose language for your FAVS:&nbsp;"
    select <<  "<select name='lang' id='lang'>"
    lang.each do |code, description|
      selected = true if current == code
      select << option_lang(code, description, selected)
    end
    select <<  "</select>"
    select << observe_field("lang",
              :url => {:controller => "manage", :action => "choose_user_lang"},
              :with => "'lang='+ escape($('lang').value)")
    select
  end
  
  def option_lang(code, description, selected = false)
    option = "<option value='#{code}' "
    if selected
      option << "selected"
    end
    option << ">#{description}</option>"
  end
end
