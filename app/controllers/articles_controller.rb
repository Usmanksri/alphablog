class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  def new
    @article=Article.new
    
  end
    def index
        #@articles=Article.all

        @articles=Article.paginate(page: params[:page], per_page: 5)
       
    end

    def show
      @a_id=@article.id

    end


    def edit

    end

    def update
        if @article.update(article_params)
          flash[:notice] = "Article was updated successfully."
          redirect_to @article
        else
          flash[:notice]= "Not updated  #{@article.errors.full_messages}"
         redirect_to article_path
        end
    end


    def create
        @article=Article.new(article_params)
        @article.user = current_user

     if @article.save
         flash[:notice]= "Article added Successfully"
         redirect_to users_path

     else
         flash[:notice]= "Not signedUP #{article_params}"
         redirect_to users_path
     end
    end

    def destroy
      @article.delete
    end
    

    def article_params
        params.require(:article).permit(:title, :description, category_ids: [])
      end

    def set_article
      @article=Article.find(params[:id])
    end


    def require_same_user
      if current_user != @article.user
        flash[:notice] = "You can only edit or delete your own article"
        redirect_to @article
      end
    end

end
