class Veterinarian
  attr_reader :name,
              :customers,
              :pets

  def initialize(vet_params)
    @name = vet_params[:name]
    @customers = vet_params[:customers]
    @pets = vet_params[:pets].flatten
  end

  # def pets_by_age
  #   @customers.map do |customer|
  #     customer.pets.sort_by do |pet|
  #       pet.age
  #     end.reverse
  #   end.flatten
  # end

  def pets_by_age
    @pets.sort_by do |pet|
      pet.age
    end.reverse
  end

  def  pets_by_customer
    @customers.map do |customer|
      customer.pets.count
    end
  end
end
