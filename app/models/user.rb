class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    # メールアドレスが"guesut@example.com"のユーザーがいればそれを取得、
    # 存在しなければブロック内の情報を持つユーザーを取得。
    find_or_create_by!(email: 'guest@example.com') do |user|
      # パスワードをランダムで生成
      user.password = SecureRamndom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end
end
