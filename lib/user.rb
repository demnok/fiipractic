module SuperKitchen

  class User < Sequel::Model

  one_to_many :recipes, :key => :created_by

    class Entity < Grape::Entity
      expose :name
    end

  end

end
