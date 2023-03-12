class UsersController < ApplicationController

def new
        @user=User.new
end

def edit
    @user=User.find(params[:id])

end

def update
    @user=User.find(params[:id])
    if @user.update(user_params)
     flash[:notice]= "User Updated Successfully"
      redirect_to article_path
    else
        flash[:notice]= "User Not add #{@user.errors.full_messages} "
        redirect_to article_path
    end


end



def create
           @user=User.new(user_params)
        if @user.save
            flash[:notice]= "User added Successfully"
            redirect_to article_path

        else
            flash[:notice]= "Not signedUP #{@user.errors.full_messages}"
            redirect_to article_path
        end


end


    private 
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
