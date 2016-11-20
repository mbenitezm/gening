class DocumentsController < ApplicationController
  def new
    redirect_to product_catalog_reports_path unless params[:description]
    @document = Document.new
  end

  def create
    document = Document.create(object_params)

    if document
      document.part = Part.find_by(description: params[:description])
      document.save
      flash[:success] = "Archivo agregado"
      redirect_to product_documents_reports_path(description: document.part.description)
    else
      flash[:danger] = "Error al agregar archivo"
      render :new
    end
  end

  def destroy
    document = Document.find(params[:id])
    document.destroy
    redirect_to product_catalog_reports_path
  end

  private
  def object_params
    params.require(:document).permit(:description, :file)
  end
end
