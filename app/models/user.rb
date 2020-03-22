class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :role_users
  has_many :roles, through: :role_users
  has_many :todos, foreign_key: :developer_id
  has_many :project_developers, foreign_key: :developer_id
  has_many :projects,  -> { where(project_developers: { is_creator: true }) }, through: :project_developers

  def admin?
    roles.find_by_name("admin").present?
  end

  def full_name
    [first_name, last_name].join(" ")
  end

  def self.test
    data = {}
    data['a'] = 1
    data['b'] = 2
    data
  end

end
