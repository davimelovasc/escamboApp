class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]


  def index
    @admins = policy_scope(Admin)
  end

  def new
    @admin = Admin.new
    authorize @admin
  end

  def create
    @admin = Admin.new(params_admin)
    @admin.role = "normal"
    if @admin.save
      redirect_to backoffice_admins_path, notice: "Administrador #{@admin.email} cadastrado com sucesso."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if AdminService.update(params[:id], params_admin)
      redirect_to backoffice_admins_path, notice: "Administrador #{@admin.email} atualizado com sucesso."
    else
      render :edit
    end
  end

  def destroy
    email = @admin.email
    if @admin.destroy
      redirect_to backoffice_admins_path, notice: "Administrador #{email} excluído com sucesso."
    else
      render :index
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def params_admin
    params.require(:admin).permit(:email, :name, :password, :password_confirmation)
  end

end
