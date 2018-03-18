class FetcherController < ApplicationController
  require 'net/http'
  require 'json'

  def get
  end

  def show
    token = params[:token]
    k = params[:k]
    @postlimit = params[:n]
    query = params[:q]
    @query = params[:q]

    uri = URI.parse("https://graph.facebook.com/v2.12/" + query + "/posts?fields=message%2Cshares&limit=" + k + "&access_token=" + token)
    req = Net::HTTP::Get.new(uri.request_uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = (uri.scheme == 'https')
    res = http.request(req)

    array = JSON.parse res.body

    sortedArray = {
      :data => array['data'].sort_by { |hash| -hash['shares']['count'] }
    }
    @lib = sortedArray
  end
end
