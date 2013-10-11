class AnnotationsController < ApplicationController
  respond_to :json
  
  def index
    @annotations = Annotation.all
    
    respond_with @annotation
  end
  
  def show
    @annotation = Annotation.find(params[:id])
    
    respond_with @annotation
  end
  
  def update
    @annotation = Annotation.find(params[:id])
    @annotation.update_attributes(annotation_params)

    respond_with @annotation
  end
  
  def create
    @annotation = Annotation.create(annotation_params)
    
    respond_with @annotation
  end
  
  def destroy
    @annotation = Annotation.find(params[:id])
    @annotation.destroy
    
    respond_with @annotation
  end
  
  private
  
  def annotation_params
    params.require(:annotation).permit(:content, :x, :y, :document_id)
  end

end
