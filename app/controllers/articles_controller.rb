class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end
    
    def create
        Article.create(create_params)
        redirect_to '/' and return
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update
        article = Article.find(params[:id])
        article.update(update_params)
        redirect_to '/' and return
    end
    
    def show
        @article = Article.find(params[:id])
        @reviews = Review.where(article_id: @article.id)
    end
    
    def destroy
        article = Article.find(params[:id])
        article.delete
        redirect_to '/' and return
    end
    
    private
    def create_params
        params.require(:article).permit(:title, :text, :image).merge(user_id: current_user.id)
    end
    
    def update_params
        params.require(:article).permit(:title, :text, :image).merge(user_id: current_user.id)
    end
end

