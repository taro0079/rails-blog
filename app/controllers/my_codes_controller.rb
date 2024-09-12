require "net/http"
require "uri"

class MyCodesController < ApplicationController
  def index
    uri = URI.parse("https://api.github.com/repos/taro0079/yadm-dotfiles/contents/.vimrc")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    headers = { "Accept"=> "application/vnd.github.v3.raw" }
    response = http.get(uri.request_uri, headers)
    @my_code = response.body
  end

  private

  # def escape_html(text)
  #   text
  #   .gsub("&", "&amp;")
  #   .gsub("<", "&lt;")
  #   .gsub(">", "&gt;")
  #   .gsub('"', "&quot;")
  #   .gsub("'", "&#039;")
  # end
end
