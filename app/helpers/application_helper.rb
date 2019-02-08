module ApplicationHelper
  def login_helper
    if current_user
      (tag.li(link_to "Logout", destroy_user_session_path, method: :delete))
    else
      (tag.li(link_to "Login", new_user_session_path)) + " ".html_safe +
      (tag.li(link_to "Register", new_user_registration_path))
    end
  end

  def rating_helper
    #display number of full stars
    rating = @company.rating
    stars = (tag.span "") 
    rating.to_i.times do
      stars += (tag.i "star", class: "material-icons")
    end
    #display half star
    decimal = rating - rating.to_i
    if decimal >= 0.5
      stars += (tag.i "star_half", class: "material-icons")
      #display number of empty stars
      (4 - rating.to_i).times do
        stars += (tag.i "star_border", class: "material-icons")
      end
    else
      #display number of empty stars
      (5 - rating.to_i).times do
        stars += (tag.i "star_border", class: "material-icons")
      end
    end
    stars
  end
end
