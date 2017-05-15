class KittensController < ApplicationController
  def new
    @kitten = Kitten.new
  end

  def index
    @kittens = Kitten.all
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "Kitten created."
      redirect_to @kitten
    else
      flash.now[:danger] = "Error, please check over your inputs."
      render 'new'
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      flash[:success] = "Kitten updated"
      redirect_to @kitten
    else
      flash[:danger] = "Error, please check over your inputs."
      render 'edit'
    end
  end

  def destroy
    Kitten.find(params[:id]).destroy
    flash[:success] = "Kitten destroyed."
    redirect_to root_path
  end

  private

    def kitten_params
      params.require(:kitten).permit(:name,:age,:cuteness,:softness)
    end
end