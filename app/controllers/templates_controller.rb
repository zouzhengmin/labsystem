class TemplatesController < ApplicationController

  before_action :find_templates, only: [:show, :edit, :update, :destroy]

  def history
  end

  def index
    @samples = Sample.includes(:items)
  end

  def show
  end

  def new
    @template = Template.new
  end

  def create
    item_ids = params[:item].keys

    item_ids.to_a.each do |item_id|
      @template = Template.create(
                              :sample_id => params[:sample_id],
                              :item_id => item_id)
    end

    if @template.save
      redirect_to templates_path
    else
      render :new
    end

  end

  def edit
  end

  def update

  end

  def destroy
  end

  private

    def find_templates
      @templates = Template.find(params[:id])
    end

    def sample_params
      params.require(:sample).permit!
    end

end
