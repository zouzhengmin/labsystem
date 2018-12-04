class ItemsController < ApplicationController

  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    # binding.pry
    @item.delete
    redirect_to items_path
  end

  private

    def find_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name)
    end

end
