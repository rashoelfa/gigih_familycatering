class MenuController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :set_menu_item, only: %i[ update_menu_item delete_menu_item ]

  # GET /menu?category=true or /menu
  def show_all_menu_items
    if params[:category]
     @menu_items = MenuItem.show_all
    else
     @menu_items = MenuItem.all
    end

    render json: @menu_items.to_json
  end

  # GET /category
  def show_all_categories
    @category = Category.all

    render json: @category.to_json
  end
  
  # POST /menu/create
  def create_menu_item
    @menu_item = MenuItem.new(menu_item_params)

    if @menu_item.save 
      render json: @menu_item.to_json, status: :created
    else
      render json: @menu_item.errors, status: :unprocessable_entity
    end
  end

  # POST /menu/create/category
  def create_item_category
    @item_category = ItemCategory.new(params.permit(:menu_item_id, :category_id))

    if @item_category.save
      render json: @menu_item.to_json, status: :created
    else
      render json: @menu_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /menu/update
  def update_menu_item
    if @menu_item.update(menu_item_params)
      render json: @menu_item.to_json, status: :ok
    else
      render json: @menu_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /menu/delete
  def delete_menu_item
    if @menu_item.destroy
      render json: ["successfully deleted"], status: :ok
    else
      render json: @menu_item.errors, status: :unprocessable_entity
    end
  end

  private
    def set_menu_item
      @menu_item = MenuItem.find(params[:id])
    end

    def menu_item_params
      params.permit(:name, :price)
    end
end
