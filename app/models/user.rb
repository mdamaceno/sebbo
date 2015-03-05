class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Authorization over the pages
  enum role: { "Usuário" => 0, "Administrador" => 1 }
  enum gender: { "Masculino" => 0, "Feminino" => 1, "Outro" => 2 }
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= "Usuário"
  end
  
end
