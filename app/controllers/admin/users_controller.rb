module Admin
  class UsersController < Admin::ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :check_permission, except: [:edit, :update, :destroy]

    def index
    end

    def show
    end

    def new
      @user = User.new
    end

    def edit
      unless current_user.role == "Administrador" || @user.id == current_user.id
        redirect_to edit_admin_user_path(current_user), notice: "Você não possui permissão para este acesso."
      end
    end

    def create
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to [:admin, @user], notice: "Página #{@user.title} criada com sucesso." }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to [:admin, @user], notice: 'Usuário atualizado com sucesso.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def set_user
      if User.find_by_id(params[:id])
        @user ||= User.find_by_id(params[:id])
      else
        unless current_user.role == "Administrador"
          redirect_to edit_admin_user_path(current_user), notice: "Você não possui permissão para este acesso."
        else
          redirect_to edit_admin_user_path(current_user), notice: "Não existe usuário com o ID especificado."
        end
      end
    end

    def user_params
      params.require(:user).permit(:email, :password, :role, :gender, :name,
                                   :address, :contact1, :contact2, :doc, :avatar, :description)
    end

  end
end
