class ProfesionesController < ApplicationController
  before_action :set_profesion, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @profesiones = Profesion.search(params[:search]).page(params[:page]).per_page(5)   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profesiones }
    end
  end
  
  def show
    @profesion = Profesion.find(params[:id])
  end

  def new
    @profesion = Profesion.new
  end

  def edit
    @profesion = Profesion.find(params[:id])
  end

  def create
    @profesion = Profesion.new(profesion_params)
    @profesion.save
  end

  def update
    @profesion = Profesion.find(params[:id])
    render :action => :edit unless @profesion.update_attributes(profesion_params)
  end

  def destroy
    @profesion = Profesion.find(params[:id])
    @profesion.destroy
  end
  
  private
  def set_profesion
    @profesion = Profesion.find(params[:id])
  end

  def profesion_params
    params.require(:profesion).permit(:nombre, :descripcion)
  end
end