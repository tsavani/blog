class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :blog_master
  has_many :comment

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create  :welcome_message
  

  private

  def welcome_message
    #UserMailer.welcome_message(self).deliver
    Rails.logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    UserNotifier.send_signup_email(self).deliver
  end

end
