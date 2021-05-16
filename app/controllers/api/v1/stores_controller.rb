class::Api::V1::StoresController < ApplicationController

    # GET for all stores
    def index
        stores = Store.all

        render json: {status: 'SUCCESS', message:'Loaded Stores', data:stores},status: :ok

    end
end