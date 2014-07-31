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
      can :edit, Song do |song|
        song.user_id == user.id
      end
      can :edit, Comment do |comment|
        comment.user_id || comment.song.user_id == user.id
      end
    end
  end
end
