# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  liker_id      :integer          not null
#  likeable_id   :integer          not null
#  likeable_type :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Like < ApplicationRecord

    belongs_to :liker,
        foreign_key: :liker_id,
        class_name: :User

    belongs_to :likeable, polymorphic: true,
        foreign_key: :likeable_id,
        class_name: :likeable_type 
end
