# == Schema Information
#
# Table name: gardens
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  size            :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  garden_owner_id :integer          not null
#
require 'test_helper'

class GardenTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
