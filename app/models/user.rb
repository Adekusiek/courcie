class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :confirmable

  has_many :demandposts

  has_many :send_messages, class_name: 'Message', foreign_key: 'user_from_id'
  has_many :recieve_messages, class_name: 'Message', foreign_key: 'user_to_id'

  has_many :usercontacts
  has_many :iteneraries

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"}, default_url: "profile-default.jpg"
  validates_attachment_content_type :avatar, content_type: ["image/jpg","image/jpeg","image/png"]

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
        confirmed_at: Time.now.utc,
        confirmation_token: nil
      )
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
