# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#
class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true 

    has_many :artworks,
    foreign_key: :artist_id, 
    class_name: :Artwork,
    dependent: :destroy, 
    inverse_of: :artist

    has_many :shares, 
    foreign_key: :viewer_id, 
    class_name: :ArtworkShare,
    dependent: :destroy, 
    inverse_of: :viewer

    has_many :shared_artworks, 
    through: :shares,
    source: :artwork

    has_many :comments,
    foreign_key: :author_id,
    class_name: :Comment,
    inverse_of: :author,
    dependent: :destroy

end
