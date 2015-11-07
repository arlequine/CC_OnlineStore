# Este archivo sirve para crear registros de prueba
module UserSeeds
  def self.import(filename=File.dirname(__FILE__) + "/../usuarios.csv")
    field_names = nil
    User.transaction do
      File.open(filename).each do |line|
        data = line.chomp.split(',')
        if field_names.nil?
          field_names = data
        else
          attribute_hash = Hash[field_names.zip(data)]
          p attribute_hash
          User.create!(attribute_hash)
        end
      end
    end
  end
end

module ProductSeeds
  def self.import(filename=File.dirname(__FILE__) + "/../products.csv")
    field_names = nil
    Product.transaction do
      File.open(filename).each do |line|
        data = line.chomp.split(',')
        if field_names.nil?
          field_names = data
        else
          attribute_hash = Hash[field_names.zip(data)]
          p attribute_hash
          Product.create!(attribute_hash)
        end
      end
    end
  end
end