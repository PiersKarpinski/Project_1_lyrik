class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    if user.role? :admin
      can :manage, :all
    else user.role? :user
      can :read, Genre
      can :create, Song
      can :create, Comment
      can :show, Comment
      can :edit, Song do |song|
        song.user_id == user.id
      end
      can :destroy, Song do |song|
        song.user_id == user.id
      end
      can :destroy, Comment do |comment|
        (comment.user_id == user.id) || (comment.song.user_id == user.id)
      end
      can :edit, Comment do |comment|
        (comment.user_id == user.id) || (comment.song.user_id == user.id)
      end
    end
  end
end
