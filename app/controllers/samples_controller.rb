class SamplesController < ApplicationController

  before_action :find_sample, only: [:show, :edit, :update, :destroy]

  def index
    @samples = Sample.all
  end

  def show
  end

  def new
    @sample = Sample.new
    @templates = Template.includes(:samples,
                                   :items,
                                   :template_name,
                                   :template_values,
                                   )
     @temp_names = TemplateName.includes(:templates)
     @item = Item.pluck(:id,:name).to_h
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
  
  def history
    @samples = Sample.includes(:templates).order('id desc')
  end


  private

    def find_sample
      @sample = Sample.find(params[:id])
    end

    def sample_params
      params.require(:sample).permit(:name, :code)
    end

end
