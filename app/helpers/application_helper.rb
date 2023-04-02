module ApplicationHelper
  def author_github_link
    link_to "author", 'https://github.com/Tobi1246'
  end

  def repo_app_link
    link_to "repo", "https://github.com/Tobi1246/testguru"
  end

  def flash_massage
    flash.each do |name, message|
      message
    end
  end
  
end
