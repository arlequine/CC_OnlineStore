class ProductsView
  # Recuerda que la única responsabilidad de la vista es desplegar data al usuario

  def index(all_products)
    all_products.each_with_index do |product, index|
      
      puts "Product no.#{index+1}: #{product.name}" 
      puts "Description: #{product.description}" 
      puts "Price: $#{product.price}"
      puts " "
    end
  end

  def product_input
    puts "Choose a number product: "
    print "=>"
    gets.chomp
  end

  def show_name(name, num_product)
    if num_product == 1
      puts "You have bought #{name}."
    else
      puts "You have deleted: #{name}."
    end
  end

  def message_save(p_name)
    puts "Product #{p_name} was added to stock"
  end

  def create
  end

  def delete
  end

  def update
  end

  def error
  end
end