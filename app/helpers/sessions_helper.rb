module SessionsHelper
    #realizar o acesso da sessão
    def sign_in(user)
        session[:user_id] = user.id
    end
    # deslogar da sessão
    def sign_out
        session.delete(:user_id)
    end
    #vai acessar através do cache, se ela não encontrar será realizar um novo acesso da sessão
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    #verificará se o usuário está logado, senão pode retornar uma mensagem de erro
    def user_signed_in?
        !current_user.nil?
    end
end
