# == Schema Information
#
# Table name: announcements
#
#  id         :integer          not null, primary key
#  message    :text
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  broadcast  :boolean          default(FALSE)
#

class AnnouncementsController < ApplicationController
  def index
    @object_collection = filter_collection.order(created_at: :desc)
                                          .paginate(page: params[:page],
                                                    per_page: 5)
  end

    def create
      @object = Announcement.new(object_params)
      if @object.save
        flash[:success] = 'Anuncio creado exitosamente'
        redirect_to announcements_path
      else
        flash[:error] = 'información incompleta'
        render :index
      end
    end

  private

  def object_params
    params.require(:announcement).permit(:message, :broadcast, :company_id)
  end

  def filter_collection
    return Announcement.all if current_user.admin?
    Announcement.for_company(current_user.company_id)
  end
end
