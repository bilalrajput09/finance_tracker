class FriendshipsController < ApplicationController
    def create
        friendship = Friendship.new(friend_id: params[:friend_id], user_id: current_user.id)
        if friendship.save
            flash[:notice] = "Followed successfully"
        else
            flash[:alert] = "Something went wrong"
        end
        redirect_to my_friends_path 
    end

    def destroy
        friendship = Friendship.where(friend_id: params[:id], user_id: current_user.id).first
        
        friendship.destroy 
        flash[:notice] = "Friend Unfollowed"
        redirect_to my_friends_path
    end
end