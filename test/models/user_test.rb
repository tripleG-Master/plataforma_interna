require 'active_support/core_ext/string/filters'

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'crea un admin válido y una oferta de trabajo' do
    # Creamos un usuario de prueba
    usuario = User.create!(
      name: 'Juan Pérez', 
      email: 'juan.perez@email.com',
      password: 'password123',
      password_confirmation: 'password123' 
    )

    # Verificamos que el usuario es válido
    assert usuario.valid?, "El usuario debería ser válido: #{usuario.errors.full_messages.join(', ')}"

    # Creamos una oferta de trabajo asociada al usuario
    joboffer = Joboffer.create!(
      title: 'prueba haha',
      description: 'descripcion',
      user_id: usuario.id  # Asigna el user_id
    )

    # Vemos que la oferta de trabajo es válida
    assert joboffer.valid?, "La oferta de trabajo debería ser válida: #{joboffer.errors.full_messages.join(', ')}"
    assert_equal 'prueba haha', joboffer.title
    assert_equal 'description', joboffer.description
    assert_equal usuario.id, joboffer.user_id  
  end
end