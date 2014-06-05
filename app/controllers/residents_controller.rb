class ResidentsController < ApplicationController
  load_and_authorize_resource
  def new
    @resident = Resident.new
  end

  def create
    @resident = Resident.new(resident_params)
    puts @resident.inspect  ## See which record @user is referring to, check if it has an avatar
    Visit.track(@resident, request.remote_ip)
    if @resident.save 
      redirect_to residents_path
    else 
      render 'new'
    end
  end

  def edit
    @resident = Resident.find(params[:id])
  end

  def update
    @resident = Resident.find(params[:id])
    if @resident.update(resident_params)
      redirect_to residents_path
    else
      render 'edit'
    end
  end

  def show
    @resident = Resident.find(params[:id])
  end

  def index
    @residents = Resident.all
  end

 
  def resident_params
    params.require(:resident).permit(:name, :bio, :goals, :partner_id, :image, :user_id)
  end
end
