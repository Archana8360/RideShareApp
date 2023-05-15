class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/,message:"must be a valid email address"}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  def jwt_payload
    super
  end
  has_one :info
  has_many :vehicle
  has_many :ride




  before_create :create_activation_digest

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end
  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
  end

  attr_accessor :activation_token

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  private

  def create_activation_digest
    self.activation_token = SecureRandom.urlsafe_base64
    self.activate_token = self.activation_token
    self.activation_digest = User.digest(self.activation_token)

  end

  def self.digest(token)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(token, cost: cost)
  end

  
end
