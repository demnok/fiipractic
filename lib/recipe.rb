module SuperKitchen

  class Recipe < Sequel::Model

    many_to_one :user, :key => :created_by

    class Entity < Grape::Entity
      expose :title
      expose :body
      expose :user, :as => :created_by, using: User::Entity
    end

  end

end
