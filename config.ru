require 'sequel'

require 'pp'
require 'grape'
require 'grape-entity'

DB = Sequel.connect('sqlite://t1.db')

require_relative 'lib/user.rb'
require_relative 'lib/recipe.rb'

module SuperKitchen

  class API < Grape::API

    version 'v1'
    format :json

    resource :recipes do

      params do
        requires :id, type: Integer, desc: 'Recipe ID'
      end
      route_param :id do
        get do
          recipe = Recipe[params[:id]]
          if recipe
            present recipe
          else
            error!  'Recipe not found.', 404
          end
        end
      end

    end

  end
end

run SuperKitchen::API
