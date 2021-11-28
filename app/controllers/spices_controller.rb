class SpicesController < ApplicationController 

 # GET#
 def index
    spices = Spice.all
    render json: spices
  end
#don't forget to define the params function which will be passed inside the create
# POST #
  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created  
  end

# make sure you follow each step to pass the params and the if statement
# PATCH
  def update
    spice = Spice.find_by(id: params[:id])
    if spice 
      spice.update(spice_params)
      render json: spice
    else 
      render json: { error: "Spice not found" }, status: :not_found
    end
  end
#DELETE
  def destroy
    spice = Spice.find_by(id: params[:id])
    if spice 
      spice.destroy
      head :no_content
    else
      render json: { error: "Spice not found" }, status: :not_found

    end
  end
 # def show
  #  spice = Spice. find_by(id: params[:id])
 #   if spice
  ##  else
  #  render json: { error: "Spice not found"}, status: :not_found
  ## end

# private, we need to do the params 
private
  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end


   

end