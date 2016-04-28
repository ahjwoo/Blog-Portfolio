class WelcomeController < ApplicationController

  def index
    @posts = Post.all.limit(3).order("created_at desc")
    @projects = Project.all.limit(3).order("created_at desc")

  end

  def new
    @contact = Contact.new
  end


  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
    else
      flash.now[:error] = "Cannot send message."
      redirect_to root_path
    end
  end

end
