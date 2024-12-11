require "test_helper"

class ApplicationTest < ActiveSupport::TestCase
  
  def setup
    @oferta_de_trabajo = Joboffer.create(title: 'Desarrollador web', description: 'Desarrollar aplicaciones web')
    @usuario = User.create(name: 'Juan Pérez', email: 'juan@example.com')
  end

  test 'crea una postulación válida' do
    postulacion = Application.new(joboffer: @oferta_de_trabajo, user: @usuario)
    assert postulacion.valid?
  end

  test 'no crea una postulación sin una oferta de trabajo' do
    postulacion = Application.new(user: @usuario)
    assert_not postulacion.valid?
  end

  test 'no crea una postulación sin un usuario' do
    postulacion = Application.new(joboffer: @oferta_de_trabajo)
    assert_not postulacion.valid?
  end
  
end
