module ApplicationHelper

  def show_login(user)
  	if user
  	  link_to user.email + " " + number_to_currency(user.balance).to_s, logout_path
  	else
  	  link_to 'Log In', login_path
  	end
  end

  def create_navlink(name, url)
  	cname = name.downcase
  	is_active = cname == controller.controller_name
  	active = is_active ? "active" : ""
  	link = link_to(name, url)
  	"<li class=#{active}>#{link}</li>".html_safe
  end

end
