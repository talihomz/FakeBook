require 'pp'

class FriendRequestsController < ApplicationController
    before_action :set_friend_request, except: [:index, :create]

    def create
        friend = User.find(params[:friend_id])
        @friend_request = current_user.friend_requests.build(friend: friend)

        authorize @friend_request

        if @friend_request.save
            flash[:success] = "Friend request sent successfully!"
            redirect_to find_friends_path
        else
            flash.now[:error] = @friend_request.errors
        end
    end

    def update
        @friend_request.accept
        head :no_content
    end

    def index
        @incoming = FriendRequest.where(friend: current_user)
        @outgoing = current_user.friend_requests
    end

    def destroy
        if @friend_request.nil?
            flash[:error] = "Cannot delete NULL friend request."
            redirect_to find_friends_path       
        else
            authorize @friend_request

            if @friend_request.destroy
                flash[:success] = "Cancelled successfully!"                
                redirect_to find_friends_path                 
            else
                flash.now[:error] = @friend_request.errors.messages
            end     
        end  
    end

    def set_friend_request
        @friend_request = FriendRequest.where("user_id = ? AND friend_id = ?", current_user.id, params[:id]).first
    end
end
