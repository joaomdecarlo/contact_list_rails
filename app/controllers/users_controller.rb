class UsersController < ApplicationController

    before_action :require_logged_in_user, only: [:edit, :update] 

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = 'Usuário cadastrado com sucesso'
            redirect_to root_url    #redirecionará para a página index
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if current_user.update(user.params)
            flash[:success] = 'Dados atualizados com sucesso'
            redirect_to contacts_url
        else
            render 'edit'
        end
    end

    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end    
end