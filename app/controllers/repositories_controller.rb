class RepositoriesController < ApplicationController
    skip_before_action :verify_authenticity_token
    require 'net/http'
    
    def index
        @repos = Repository.all
    end

    def search
        languages = ['elixir','ruby','php','c\#','c\+\+'];
        topRepos = []
        # params[:languages].each do |language|
        languages.each do |language|
            url = URI.parse("https://api.github.com/search/repositories?q=language:#{language}&per_page=5")
            res = Net::HTTP.get_response(url)
            repos = JSON.parse res.body

            @response = repos
            puts "Parsing fetched url: #{url}"
            
            if repos.to_options[:items] != nil
                repos.to_options[:items].each do |loadedRepo|
                    if Repository.where(url:loadedRepo.to_options[:full_name]).take 
                        puts Repository.where(url:loadedRepo.to_options[:full_name]).take
                        puts "Repository #{loadedRepo.to_options[:full_name]} found. Skipping insertion."
                        next
                    end

                    repo = Repository.new
                    repo.name = loadedRepo.to_options[:name]
                    repo.url = loadedRepo.to_options[:full_name]
                    repo.language = loadedRepo.to_options[:language]
                    repo.owner = loadedRepo.to_options[:owner].to_options[:login]
                    repo.description = loadedRepo.to_options[:description]
                    repo.save
                end
            end
            
        end

        @repos = Repository.all

        render "index"
    end

    def show
        @repo = Repository.find(params[:id])
    end
end
