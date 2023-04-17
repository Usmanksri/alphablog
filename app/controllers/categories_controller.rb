class CategoriesController < ApplicationController

    before_action :require_admin, except: [:index, :show]

    def new
        @category=Category.new
    end

    def index
        @categories=Category.all

        

    end

    def edit
        @category=Category.find(params[:id])

    end

    def update 
        @category=Category.find(params[:id])
        if @category.update(category_params)
        flash[:notice]= "Category updated Successfully"
         redirect_to categories_path

        else
            flash[:notice]= @category.errors.full_messages
            redirect_to @category
        end
    end


    def show
        @category=Category.find(params[:id])
        @articles=@category.articles.paginate(page: params[:page], per_page: 5)
    end

    def create
    @category=Category.new(category_params)
     if @category.save
         flash[:notice]= "Category added Successfully"
         redirect_to articles_path
     else
         flash[:notice]= @category.errors.full_messages
         redirect_to articles_path
     end

    end


    private

    def category_params
        params.require(:category).permit(:name)
      end

    def require_admin
        if !(logged_in? && current_user.admin?)
        flash[:notice]= "Only admins can add categories"
         redirect_to articles_path
        end

    end



end