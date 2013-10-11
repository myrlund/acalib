class DocumentsController < ApplicationController
  respond_to :json
  
  def index
    @documents = Document.all
    
    respond_with @document
  end
  
  def show
    @document = Document.find(params[:id])
    
    respond_with @document
  end
  
  def update
    @document = Document.find(params[:id])
    @document.update_attributes(document_params)

    respond_with @document
  end
  
  def create
    @document = Document.create(document_params)
    
    respond_with @document
  end
  
  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    
    respond_with @document
  end
  
  private
  
  def document_params
    params.require(:document).permit(:title, :attachment, :author, :source_url, :collection_id, :tag_ids)
  end
  
end
