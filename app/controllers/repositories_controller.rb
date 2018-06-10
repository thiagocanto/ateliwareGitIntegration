class RepositoriesController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    require 'net/http'
    
    def index
        # Language URL example https://api.github.com/repos/{user}/{repo}/languages
        url = URI.parse("https://api.github.com/repos/dotnet/corefx/languages")
        res = Net::HTTP.get_response(url)
        @languages = JSON.parse res.body
    end

    def search
        languages = ['elixir','ruby','php'];
        topRepos = []
        # params[:languages].each do |language|
        languages.each do |language|
            url = URI.parse("https://api.github.com/search/repositories?q=language:#{language}&per_page=5")
            res = Net::HTTP.get_response(url)
            topRepos << (JSON.parse res.body)
        end

        @reposByLanguages = topRepos 
    end
end
