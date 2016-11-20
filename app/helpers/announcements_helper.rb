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

module AnnouncementsHelper
end
