class::Api::V1::StoresController < ApplicationController

    # GET for all stores
    def index
        stores = Store.all

        render json: {status: 'SUCCESS', message:'Loaded Stores', data:stores},status: :ok
    end

    # POST for a new store
    def create
        store = Store.new(store_params)

        # check if saved correctly
        if store.save
            render json: {status: 'SUCCESS', message:'Added the new store', data:store},status: :ok
        else
            render json: {status: 'ERROR', message:'Could not add the new store', data:store},status: :unprocessable_entity
        end
    end


    private
    # permit a store_params to have a name for the new store
    def store_params
        params.permit(:store_name)
    end
end