# == Schema Information
#
# Table name: flowers
#
#  id          :bigint           not null, primary key
#  flower_type :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  garden_id   :integer          not null
#  gardener_id :integer          not null
#
require 'test_helper'

class FlowerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
