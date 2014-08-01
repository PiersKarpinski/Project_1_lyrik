module ApplicationHelper
  def show_user_bg(user)
    if user
      "background:transparent url(#{user.personalise}) fixed left bottom;"
    end
  end

  def show_default_bg(user)
    "wrapper-bg" unless user
  end
end

