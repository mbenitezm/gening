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

require 'test_helper'

class AnnouncementsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
