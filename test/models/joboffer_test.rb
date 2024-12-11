require "test_helper"

class JobofferTest < ActiveSupport::TestCase
  
  def setup
    usuario = User.new(
      name: 'Juan Pérez', 
      email: 'juan.perez@email.com',
      password: '123456',
      password_confirmation: '123456',
      admin: true,
      created_at: Time.now,
      updated_at: Time.now,
      confirmed_at: Time.now,
      )
    usuario.save!

  end

  test 'crea una oferta de trabajo válida' do
    user = User.first
    oferta_de_trabajo = Joboffer.new(
      title: 'Desarrollador web', 
      description: 'Desarrollar aplicaciones web',
      user_id: user.id,  
    )
    oferta_de_trabajo.save!
    assert oferta_de_trabajo.valid?

  end

  test 'no crea una oferta de trabajo sin título' do
    oferta_de_trabajo = Joboffer.new(description: 'Desarrollar aplicaciones web')
    assert_not oferta_de_trabajo.valid?.message
  end

  test 'no crea una oferta de trabajo sin descripción' do
    oferta_de_trabajo = Joboffer.new(title: 'Desarrollador web')
    assert_not oferta_de_trabajo.valid?
  end
end
