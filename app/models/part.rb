# == Schema Information
#
# Table name: parts
#
#  id          :integer          not null, primary key
#  number      :string
#  description :string
#  part_type   :string
#  weight      :float
#

class Part < ActiveRecord::Base
  has_many :documents, inverse_of: :part
end
