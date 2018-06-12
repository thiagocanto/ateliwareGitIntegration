class RepositoriesController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def index
        @repos = Repository.order(:language)
    end

    def search
        languages = ['elixir','ruby','php','javascript','c%23'];
        topRepos = []
        @response = []
        # params[:languages].each do |language|
        languages.each do |language|
            @response << (Repository.fetch language)
        end

        @repos = Repository.order(:language)

        render "index"
    end

    def show
        @repo = Repository.find(params[:id])
    end
end
