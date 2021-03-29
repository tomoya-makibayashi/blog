class TopController < ApplicationController
    def index
        @articles = Article.order('updated_at DESC').page(params[:page]).per(5)
    end
end