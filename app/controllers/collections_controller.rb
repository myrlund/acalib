class CollectionsController < ApplicationController
  respond_to :json
  
  def index
    @collections = Collection.all
    
    respond_with @collection
  end
  
  def show
    @collection = Collection.find(params[:id])
    
    respond_with @collection
  end
  
  def update
    @collection = Collection.find(params[:id])
    @collection.update_attributes(collection_params)

    respond_with @collection
  end
  
  def create
    @collection = Collection.create(collection_params)
    
    respond_with @collection
  end
  
  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy
    
    respond_with @collection
  end
  
  private
  
  def collection_params
    params.require(:collection).permit(:title, :description, :position)
  end
  
end
