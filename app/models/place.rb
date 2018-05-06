class Place < ActiveRecord::Base    
    mount_uploader :avatar, AvatarUploader
    # validates :avatar, presence: true
    acts_as_votable
    has_many :comments
    
end
