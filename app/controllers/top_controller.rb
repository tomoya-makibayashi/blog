class TopController < ApplicationController
    def index
        @articles = Article.order('updated_at DESC')
    end
end