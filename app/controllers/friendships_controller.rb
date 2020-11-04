class FriendshipsController < ApplicationController
  def create
    @to_friend = User.find(params[:id])
    if @to_friend
      @friend_r = Friendship.new
      @friend_r.requestor_id = current_user.id
      @friend_r.receiver_id = @to_friend.id
      @friend_r.status = 0
      @friend_r.save
    else
      notice 'The user you want to friend does not exist'
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:requestor_id, :receiver_id, :status)
  end
end
