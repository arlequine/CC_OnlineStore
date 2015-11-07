class UsersView

  def user_input
    print "=>"
    gets.chomp
  end


  def autentication_options
    puts "Welcome to the online store: 'Gallery camp' "
    puts "-" * 50
    puts "Select option number:"
    puts "1.Login"
    puts "2.Register"
    puts "3.Exit"
  end

  def user_name_input
    puts "Insert user name"
    print "=>"
    gets.chomp    
  end

  def user_type_input
    puts "Insert user type"
    puts "write 'vendedor' or 'cliente'"
    print "=>"
    gets.chomp    
  end

  def user_email_input
    puts "Insert email"
    print "=>"
    gets.chomp    
  end

  def user_password_input
    puts "Insert a password"
    print "=>"
    gets.chomp    
  end

  def message_save(u_name)
    puts "#{u_name} was created"
  end

  def message_exit
    puts "Thank you... Come back soon! :)"
  end

  def admin_options 
    puts "Welcome Administrador. Your type is Admin."
    puts "-" * 50
    puts "Select option number:"
    puts "1.Logout"
    puts "2.Products index"
    puts "3.Create product"
    puts "4.User index"
  end

  def seller_options
    puts "Welcome Seller. Your type is Vendedor."
    puts "-" * 50
    puts "Select option number:"
    puts "1.Logout"
    puts "2.Products index"
    puts "3.Create product"
    puts "4.Delete product"
  end

  def cliente_options
    puts "Welcome Cliente. Your type is Cliente."
    puts "-" * 50
    puts "Select option number:"
    puts "1.Logout"
    puts "2.List of Products"
  end

  def product_name_input
    puts "Insert product name:"
    print "=>"
    gets.chomp
  end

  def product_description_input
    puts "Insert a brief description of product:"
    print "=>"
    gets.chomp    
  end

  def product_price_input
    puts "Insert price of product:"
    print "=>"
    gets.chomp    
  end

  def product_empresa_input
    puts "Insert name of seller:"
    print "=>"
    gets.chomp  
  end

  def shopping
    puts "Do you want to keep shopping?"
    puts "Write yes or not"
    print "=>"
    gets.chomp
  end

  def adding
    puts "Do you want to keep adding products?"
    puts "Write yes or not"
    print "=>"
    gets.chomp
  end


  def index(all_users)
    puts "no.   Name           User type         Email"
    puts "-" * 50 
    all_users.each_with_index do |user, index| 
      puts "#{index+1}.    #{user.user_name}           #{user.user_type}         #{user.email}" 
      puts " "
    end
  end

  def errors_buyer
    puts "Please write yes or not"
  end


end