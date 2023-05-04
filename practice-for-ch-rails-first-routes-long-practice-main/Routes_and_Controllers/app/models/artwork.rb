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
end
