class UsersController
  def initialize
    @view_products = ProductsView.new
    @view_users = UsersView.new
    run
  end

  def run
    @view_users.autentication_options
    response = @view_users.user_input
    case response
      when "1" then login
      when "2" then add_user
      when "3" then exit
    end
  end

  def run_admin
    @view_users.admin_options
    response = @view_users.user_input
    case response
      when "1" then run
      when "2" then index_products
      when "3" then add_product
      when "4" then user_index
    end
  end

  def run_cliente
    @view_users.cliente_options
    response = @view_users.user_input
    case response
      when "1" then run
      when "2" then buy_product
    end
  end

  def buy_product
    follow = true
    while follow
      list = Product.all
      index_products
      num = @view_products.product_input
      show_product = get_index(num)
      list.each_with_index do |product, index|
        product.destroy if index+1 == num.to_i 
      end
      @view_products.show_name(show_product, 1)
      decision = @view_users.shopping
      if decision == "yes"
        follow = true
      elsif decision == "not"
        follow = false
      else
        @view_users.errors_buyer
      end
    end
    run_cliente
  end

  def run_vendedor(name_empresa)
    @view_users.seller_options
    response = @view_users.user_input
    case response
      when "1" then run
      when "2" then stock_vendedor(name_empresa)
      when "3" then add_product_seller(name_empresa)
      when "4" then delete_product(name_empresa)
    end
  end

  def stock_vendedor(name_empresa)
    list = Product.all
    list_product = []
    list.each do |product|
      list_product << product if product.empresa == name_empresa 
    end
    list_product
    @view_products.index(list_product)
  end

  def get_index(num)
    product_name = " "
    list = Product.all
    list.each_with_index do |product, index|
      product_name = product.name if index+1 == num.to_i 
    end
    product_name
  end

  def get_index_delete(num, list)
    product_name = " "
    list.each_with_index do |product, index|
      product_name = product.name if index+1 == num.to_i 
    end
    product_name
  end

  def index_products
    # TIP: Aquí debes de llamar al método del mismo nombre de @view
    all_products = Product.all  
    @view_products.index(all_products)
    run_admin
  end 

  def add_product
    follow = true
    while follow
      p_name = @view_users.product_name_input
      p_description = @view_users.product_description_input
      p_price = @view_users.product_price_input
      p_empresa = @view_users.product_empresa_input
      Product.create!(name: p_name, description: p_description, price: p_price, empresa: p_empresa)
      @view_products.message_save(p_name)
      decision = @view_users.adding
      if decision == "yes"
        follow = true
      elsif decision == "not"
        follow = false
      else
        @view_users.errors_buyer
      end
    end
    run_admin
  end

  def add_product_seller(name_empresa)
    p_name = @view_users.product_name_input
    p_description = @view_users.product_description_input
    p_price = @view_users.product_price_input
    p_empresa = name_empresa
    Product.create!(name: p_name, description: p_description, price: p_price, empresa: p_empresa)
    @view_products.message_save(p_name)
  end

  def delete_product(name_empresa)
    list = stock_vendedor(name_empresa)
    num = @view_products.product_input
    show_product = get_index_delete(num, list)
    list.each_with_index do |product, index|
      product.destroy if index+1 == num.to_i 
    end
    @view_products.show_name(show_product, 2)
  end
 
  def add_user
    loop do
      u_name = @view_users.user_name_input
      u_type = @view_users.user_type_input
      u_email = @view_users.user_email_input
      u_password = @view_users.user_password_input
      if u_type == "admin"
        puts "error!. write 'vendedor' or 'cliente'"
      elsif u_type == "vendedor" || u_type == "cliente"
        User.create!(user_name: u_name, user_type: u_type, email: u_email, password: u_password)
        @view_users.message_save(u_name)
        break
      else
        puts "error!.Try again. In user type write 'vendedor' or 'cliente'"
      end
    end
  end

  def login
    u_email = @view_users.user_email_input
    u_password = @view_users.user_password_input

    list = User.all
    #show_task = get_index(num)
    pass = " "
    mail = " "
    type = " "
    seller = " "
    list.each do |user|
      if user.user_type == "admin"
        pass = user.password
        mail = user.email
      end
      if user.email == u_email && user.password == u_password 
        type = user.user_type 
        seller = user.user_name
      end
    end
    
    run_admin if u_email == mail && u_password == pass
       
    run_cliente if type == "cliente"

    run_vendedor(seller) if type == "vendedor"
       
  end

  def exit
    @view_users.message_exit
  end

  def delete

  end

  def complete
  end

  def user_index
    all_users = User.all  
    @view_users.index(all_users)
  end

end