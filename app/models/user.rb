class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do

    validates :nickname
    validates :encrypted_password,:password,:password_confirmation,length:{minimum:6},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
    validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください'}
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください'}
    validates :first_name_kana,format: {with:/[^\x01-\x7Eｦ-ﾟ]+/,message:"カタカナでご入力下さい。"}
    validates :last_name_kana, format:{with:/[^\x01-\x7Eｦ-ﾟ]+/,message:"カタカナでご入力下さい。"}
    validates :birthday
  end
end