class CartController < ApplicationController
  before_action :authenticate_user! 

  def add
    #get the id of the product
    id = params[:id]
    ## if the card exist then use it, or if not make a new cart
    if session[:cart] then
      cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end
  
    #check if tghe item is there and if so increment the quantity by 1
    #if the item is not there then set the quantity to be 1
    if cart [id] then
      cart[id] = cart[id] + 1
    else
      cart[id] = 1
    end
    
    redirect_to :action => :index
    
  end
  # added by bea
  def show
  @cart = Cart.find(params[:id])
  end
  ###
  def remove
    id = params[:id]
    cart = session[:cart]
    cart.delete id
    redirect_to :action => :index
  end

  def clearCart
    # clear cart and remove all items 
    session[:cart] = nil
    redirect_to :action => :index
    
  end

  
  def index
    #pass the cart to be displayed
    if session[:cart] then
      @cart = session[:cart]
    else
      @cart = {}
    end
  end
  
  def createOrder 
    # Step 1: Get the current user 
    @user = User.find(current_user.id) 
    # Step 2: Create a new order and associate it with the current user 
    @order = @user.orders.build(:order_date => DateTime.now, :status => 'Pending') 
    @order.save 
    # Step 3: For each item in the cart, create a new item on the order!! 
    @cart = session[:cart] || {} 
    # Get the content of the Cart 
    @cart.each do | id, quantity | 
      item = Item.find_by_id(id)
      @orderitem = @order.orderitems.build(:item_id => item.id, :title => item.title, :description => item.description, :quantity => quantity, :price=> item.price) 
      @orderitem.save 
      end
  
  
     @orders = Order.all
      @orderitems = Orderitem.where(order_id: Order.last)
      
      # session[:cart] = nil  hidden for development, Now the cart is emptied when we go to the checkout 
  end
  
end
