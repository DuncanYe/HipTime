class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy] 

  def index
    @items = Item.where(:user_id => current_user.id ).order(completed_at: :asc) if user_signed_in?
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
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

  def complete
    @item = Item.find(params[:id])
    if @item.completed?
       # @item.update_attribute(:completed_at, nil)
       @item.update({completed_at: nil})
       # 如果completed_at 有值，把質變nil
    else
       @item.update_attribute(:completed_at, Time.now)
     #如果completed_at 沒有值，把Time.now加進去
    end
    redirect_to root_path
  end

  # def uncomplete
  #   @item = Item.find(params[:id])
  #   @item.update.attribute(:updated_at)
  #   redirect_to root_path
  # end



  private

    def find_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:title, :description, :user_id)
    end

  
end
