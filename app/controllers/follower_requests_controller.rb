class FollowerRequestsController < ApplicationController
  def index
    @follower_requests = FollowerRequest.page(params[:page]).per(10)

    render("follower_requests/index.html.erb")
  end

  def show
    @follower_request = FollowerRequest.find(params[:id])

    render("follower_requests/show.html.erb")
  end

  def new
    @follower_request = FollowerRequest.new

    render("follower_requests/new.html.erb")
  end

  def create
    @follower_request = FollowerRequest.new

    @follower_request.sender_id = params[:sender_id]
    @follower_request.recipient_id = params[:recipient_id]

    save_status = @follower_request.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/follower_requests/new", "/create_follower_request"
        redirect_to("/follower_requests")
      else
        redirect_back(:fallback_location => "/", :notice => "Follower request created successfully.")
      end
    else
      render("follower_requests/new.html.erb")
    end
  end

  def edit
    @follower_request = FollowerRequest.find(params[:id])

    render("follower_requests/edit.html.erb")
  end

  def update
    @follower_request = FollowerRequest.find(params[:id])

    @follower_request.sender_id = params[:sender_id]
    @follower_request.recipient_id = params[:recipient_id]

    save_status = @follower_request.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/follower_requests/#{@follower_request.id}/edit", "/update_follower_request"
        redirect_to("/follower_requests/#{@follower_request.id}", :notice => "Follower request updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Follower request updated successfully.")
      end
    else
      render("follower_requests/edit.html.erb")
    end
  end

  def destroy
    @follower_request = FollowerRequest.find(params[:id])

    @follower_request.destroy

    if URI(request.referer).path == "/follower_requests/#{@follower_request.id}"
      redirect_to("/", :notice => "Follower request deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Follower request deleted.")
    end
  end
end
