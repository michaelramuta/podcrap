module ApplicationHelper
  def url_formatter(url)
    url.gsub(/https:\/\//, 'http://')
  end
end
