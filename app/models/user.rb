class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :confirmable

  has_many :demandposts, dependent: :destroy

  has_many :send_messages, class_name: 'Message', foreign_key: 'user_from_id'
  has_many :recieve_messages, class_name: 'Message', foreign_key: 'user_to_id'

  has_many :usercontacts
  has_many :iteneraries

  attr_reader :avatar_remote_url
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"}, default_url: "profile-default.jpg"
  validates_attachment_content_type :avatar, content_type: ["image/jpg","image/jpeg","image/png"]


  def avatar_remote_url=(url_value)
    self.avatar = URI.parse(url_value)
    # Assuming url_value is http://example.com/photos/face.png
    # avatar_file_name == "face.png"
    # avatar_content_type == "image/png"
    @avatar_remote_url = url_value
  end

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20],
        confirmed_at: Time.now.utc,
        confirmation_token: nil,
        name:     auth.info.name,
        avatar: auth.info.image
      )
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
