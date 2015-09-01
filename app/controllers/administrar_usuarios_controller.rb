class AdministrarUsuariosController < ApplicationController
  before_action :set_administrar_usuario, only: [:show, :edit, :update, :destroy]
  before_filter :restrict_user_by_role
  
  respond_to :html


  def index
    @administrar_usuarios = AdministrarUsuario.all   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @administrar_usuarios }
    end
  end
  
  def show
    @administrar_usuario = AdministrarUsuario.find(params[:id])
  end

  def new
    @administrar_usuario = AdministrarUsuario.new
  end

  def edit
    @administrar_usuario = AdministrarUsuario.find(params[:id])
  end

  def create
    @administrar_usuario = AdministrarUsuario.new(administrar_usuario_params)
    render :action => :new unless @administrar_usuario.save
  end

  def update
    @administrar_usuario = AdministrarUsuario.find(params[:id])
    render :action => :edit unless @administrar_usuario.update_attributes(administrar_usuario_params)
  end

  def destroy
    @administrar_usuario = AdministrarUsuario.find(params[:id])
    @administrar_usuario.destroy
  end
  
  protected
  def restrict_user_by_role
       @administrar_usuarios = AdministrarUsuario.all 
       @administrar_usuarios.each do |administrar_usuario|        
        if administrar_usuario.user.id == current_user.id and administrar_usuario.rol.id == 1             
                flash[:notice] = "Bienvenido #{current_user.nombre1.capitalize}"

        elsif administrar_usuario.user.id != current_user.id
          redirect_to root_path # change this to your 404 page if needed
        end             
      end           
  end

  private
    def set_administrar_usuario
      @administrar_usuario = AdministrarUsuario.find(params[:id])
    end
  
    def administrar_usuario_params
      params.require(:administrar_usuario).permit(:rol_id, :user_id)
    end
end
