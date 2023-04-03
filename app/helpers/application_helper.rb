module ApplicationHelper
  def author_github_link
    link_to "author", 'https://github.com/Tobi1246'
  end

  def repo_app_link
    link_to "repo", "https://github.com/Tobi1246/testguru"
  end

  def alert_message_class(name)
    {
      alert: 'message-alert',
      notice: 'message-notice',
      success: 'message-success'
    }[name.to_sym] || name
  end
end
