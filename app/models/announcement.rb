# == Schema Information
#
# Table name: announcements
#
#  id          :integer          not null, primary key
#  message     :text
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  broadcast   :boolean          default(FALSE)
#

class Announcement < ActiveRecord::Base
  belongs_to :customer, inverse_of: :announcements

  validates :message, presence: true

  scope :for_customer, ->(customer_id) {
    where("broadcast = ? or customer_id = ?", true, customer_id) }

  def receiver
    return "Emisión" if broadcast
    customer.name
  end
end
