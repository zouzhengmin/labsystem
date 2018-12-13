class SamplesController < ApplicationController

  before_action :find_sample, only: [:show, :edit, :update, :destroy]

  def index
    @samples = Sample.all
  end

  def show
  end

  def new
    @sample = Sample.new
  end

  def create
    @sample = Sample.new(sample_params)
    if @sample.save
      redirect_to templates_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @sample.update(sample_params)
      redirect_to samples_path
    else
      render :edit
    end
  end

  def destroy
    @sample.delete
    redirect_to samples_path
  end

  private

    def find_sample
      @sample = Sample.find(params[:id])
    end

    def sample_params
      params.require(:sample).permit(:name, :code)
    end

end