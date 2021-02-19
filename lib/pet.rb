class Pet
  attr_reader :name,
              :type,
              :age
  def initialize(pet_params)
    @name = pet_params[:name]
    @type = pet_params[:type]
    @age = pet_params[:age]
    @fed = false
  end

  def fed?
    @fed
  end

  def feed
    @fed = true
  end
end
