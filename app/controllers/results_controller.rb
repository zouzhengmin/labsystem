class ResultsController < ApplicationController

  before_action :find_results, only: [:show, :edit, :update, :destroy]

  def index
    @results = Sample.includes(:items)
  end

  def show
  end

  def new
    @result = Result.new
  end

  def create
    item_ids = params[:item].keys

    item_ids.to_a.each do |item_id|
      @result = Result.create(:name => params[:result][:name],
                              :sample_id => params[:sample_id],
                              :item_id => item_id)
    end
    
    redirect_to results_path
  end

  def edit
  end

  def update

  end

  def destroy
  end

  private

    def find_results
      @results = Result.find(params[:id])
    end


    def sample_params
      params.require(:sample).permit!
    end

end
