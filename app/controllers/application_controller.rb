class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # add routes
  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
    #returns a single bakery as JSON with its baked goods nested in an array.
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    #returns an array of baked goods as JSON, sorted by price in descending order.
    baked_goods = BakedGood.by_price
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    #returns the single most expensive baked good as JSON.
    baked_goods = BakedGood.by_price.first
    #what is the difference between this and .most_expensive ??
    
    baked_goods.to_json
  end
end
