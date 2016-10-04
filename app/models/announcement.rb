class Announcement < ActiveRecord::Base
  belongs_to :company, inverse_of: :announcements

  validates :message, presence: true

  scope :for_company, ->(company_id) {
    where("broadcast = ? or company_id = ?", true, company_id) }

  def receiver
    return "Emisión" if broadcast
    company.name
  end
end
