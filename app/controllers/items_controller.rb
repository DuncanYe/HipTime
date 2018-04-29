class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy] 

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = 'Todo was created'
      redirect_to @item
    else
      flash[:alert] = 'Not create'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:notice] = 'Todo was update'
      redirect_to @item
    else
      flash[:alert] = 'Not update'
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end



  private

    def find_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:title, :description)
    end

  
end
