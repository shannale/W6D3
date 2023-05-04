# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  image_url  :string           not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :bigint           not null
#
# Indexes
#
#  index_artworks_on_artist_id  (artist_id)
#  index_artworks_on_image_url  (image_url) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (artist_id => users.id)
#
class Artwork < ApplicationRecord
    validates :title, :image_url, presence: true 
    validates :image_url, uniqueness: true 
    validates :title, uniqueness: {scope: :artist_id }

    belongs_to :artist, 
    foreign_key: :artist_id, 
    class_name: :User

    has_many :artwork_shares, 
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    dependent: :destroy

    has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer


    def self.artworks_for_user_id(user_id)
        Artwork 
            .joins(:artwork_shares)
            .where('(artist_id = :user_id) OR (artwork_shares.viewer_id = :user_id)', user_id: user_id)
            # .or("artwork_shares.viewer_id = #{user_id}") 
    end 

end
