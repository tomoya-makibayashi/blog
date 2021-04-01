class ReviewsController < ApplicationController
    def new
        @article = Article.find(params[:article_id])
        @review = Review.new
    end
    
    def create
        Review.create(create_review_params)
        redirect_to '/'
    end
    
    private
    def create_review_params
        params.require(:review).permit(:text).merge(user_id: current_user.id, article_id: params[:article_id] )
    end
end
