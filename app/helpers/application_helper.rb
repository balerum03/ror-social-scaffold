# rubocop: disable Layout/LineLength
# rubocop: disable Metrics/CyclomaticComplexity
# rubocop: disable Metrics/PerceivedComplexity
module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  def add_friend_btn(user)
    return if current_user == user

    success_btn = 'btn btn-success mr-2'
    warning_btn = 'btn btn-warning'
    add_friendship_param = { friendship: { user_id: current_user, friend_id: user, confirmed: false } }
    delete_param = { id: find_friendship(user.id, current_user.id) }
    friendship_true = find_friendship(user.id, current_user.id)
    if Friendship.where(user_id: user.id, friend_id: current_user.id, confirmed: false).exists?
      link = capture { link_to 'Accept Request', friendship_path(find_friendship(user.id, current_user.id)), method: :put, class: 'btn btn-success mr-2' }
      link << capture { link_to 'Delete Request', friendship_path(delete_param), method: :delete, class: warning_btn }
    elsif Friendship.where(id: friendship_true, confirmed: true).exists?
      link_to 'Unfriend', friendship_path(delete_param), method: :delete, class: warning_btn
    elsif Friendship.where(user_id: current_user.id, friend_id: user.id, confirmed: false).exists?
      link = capture { link_to 'pending Request. . .', users_path, class: 'disabled btn btn-success mr-2' }
      link << capture { link_to 'Delete Request', friendship_path(delete_param), method: :delete, class: warning_btn }
    elsif !current_user.friend?(user) && !current_user.request_exists?(user)
      link_to 'Add as a Friend', friendships_path(add_friendship_param), method: :post, class: success_btn
    end
  end
end
# rubocop: enable Layout/LineLength
