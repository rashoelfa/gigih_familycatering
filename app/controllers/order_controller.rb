class OrderController < ApplicationController
  protect_from_forgery with: :null_session

  def add_customer_order
    @customer_id = params[:customer_id]
    @quantity = params[:quantity]
    @total

    @item_price = OrderDetail.get_item_price(params[:menu_item_id])
    @item_price = @item_price[0]["price"]
    @total = @item_price * @quantity.to_i

    order_params = ActionController::Parameters.new(customer_id: @customer_id, order_date: Date.today.to_s, status: 'NEW', total: @total)

    @order = Order.new(order_params.permit(:order_id, :customer_id, :order_date, :status, :total))

    if @order.save
      @check_id_order = Order.select(:id).last
      order_detail_params = ActionController::Parameters.new(order_id: @check_id_order[:id],menu_item_id: params[:menu_item_id], quantity: params[:quantity])
      @order_detail = OrderDetail.new(order_detail_params.permit(:order_id,:menu_item_id,:quantity))
      @order_detail.save
      
      render json: @order.to_json, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def add_another_order
      @order_total = Order.select(:total).find(params[:order_id])
      @total = @order_total[:total]
      @quantity = params[:quantity]
      @order_detail = OrderDetail.new(params.permit(:order_id,:menu_item_id,:quantity))
    
      @item_price = OrderDetail.get_item_price(params[:menu_item_id])
      @item_price = @item_price[0]["price"]
      @total = @total + (@item_price * @quantity.to_i)
    
      if @order_detail.save
        @order_final = Order.find(params[:order_id])

        Order.update_price(params[:order_id],@total)
      
        render json: @order_final.to_json, status: :ok
      else
        render json: @order_detail.errors, status: :unprocessable_entity
      end
  end

  def update_customer_order 
    if Order.update_status(params[:order_id])
      @order = Order.find(params[:order_id])
      render json: @order.to_json, status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def show_today_order
    @daily_order = Order.show_today_order

    render json: @daily_order.to_json, status: :ok
  end
end
