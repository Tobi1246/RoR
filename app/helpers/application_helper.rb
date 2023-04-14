module ApplicationHelper

  HASH_ALERT_MESSAGE = {
                         alert: 'alert alert-danger',
                         success: 'alert alert-success',
                         notice: 'alert alert-primary'
                        }.freeze

  def author_github_link
    link_to "author", 'https://github.com/Tobi1246'
  end

  def repo_app_link
    link_to "repo", "https://github.com/Tobi1246/testguru"
  end

  def alert_message_class(name)
    HASH_ALERT_MESSAGE[name.to_sym] || name
  end
end
