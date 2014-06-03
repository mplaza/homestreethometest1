class DonorsController < ApplicationController
	def new
    @donor = Donor.new
  end

  def create
    @donor = Donor.new(donor_params)
    if @donor.save
      redirect_to donors_path
    else
      render 'new'
    end
  end

  def edit
    @donor = Donor.find(params[:id])
    @residents = @donor.residents
  end

  def update
    @donor = Donor.find(params[:id])
    @residents = @donor.residents
    if @donor.update(donor_params)
      redirect_to donors_path
    else 
      render 'edit'
    end
  end

  def index
    @donors = Donor.all
  end

  def show
    @donor = Donor.find(params[:id])
    @residents = @donor.residents
  end
  def donor_params
    params.require(:donor).permit(:org, :address, :phone, :email, :website, :resident_id)
  end
end
