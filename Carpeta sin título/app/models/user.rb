class User < ApplicationRecord

has_many :primary_boards, class_name: "Board", foreign_key: "player_one_id"
has_many :secundary_boards, class_name: "Board", foreign_key: "player_two_id"


#has_many :cells

validates :username, :password, :nickname, presence: true
validates :password, length: {minimum: 8}
validates :username, :nickname, length: {in: 4..15}
validates :username, uniqueness: true

scope :connected, -> {where(connected: true)}
scope :playing, -> {where(playing: true)}
#scope :id, -> (user_id) {where("id = ?" , user_id)}

before_create :set_token

def set_token
self.token = SecureRandom.urlsafe_base64
end

def valid_password?(pass)
password.present? && password == pass
end


end
