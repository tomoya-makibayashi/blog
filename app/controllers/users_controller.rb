class UsersController < ApplicationController
    def show
        id = current_user.id
        @articles = Article.where(user_id: id).order('updated_at DESC').page(params[:page]).per(5)
        article = Article.find(params[:id])
        @reviews = Review.where(article_id: article.id).order('updated_at DESC')
    end
    
    def edit
        @user = User.find(current_user.id)
    end
    
    def update
        user = User.find(params[:id])
        user.update(update_user_params)
        redirect_to controller: :users, action: :show and return
    end
    
    private
    def update_user_params
        params.require(:user).permit(:nickname, :prefecture, :age, :hobby, :motto, :self, :user_image)
    end
end
