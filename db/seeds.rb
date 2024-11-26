# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Joboffer.destroy_all


joboffers_data = [
  {
    title: 'Científico/a de Datos Senior',
    description: 'Buscamos un/a científico/a de datos senior para liderar proyectos de análisis de datos y machine learning. Deberás desarrollar modelos predictivos, realizar análisis exploratorios y presentar insights accionables a los equipos de negocio.',
    salary: 80000 # Ejemplo de salario
  },
  {
    title: 'Diseñador/a de Experiencia de Usuario (UX) Senior',
    description: 'Buscamos un/a diseñador/a UX senior para crear experiencias de usuario excepcionales. Deberás realizar investigaciones de usuarios, diseñar wireframes y prototipos, y colaborar con equipos de desarrollo.',
    salary: 70000 # Ejemplo de salario
  },
  {
    title: 'Ingeniero/a DevOps',
    description: 'Buscamos un/a ingeniero/a DevOps para automatizar nuestros procesos de desarrollo y despliegue. Deberás trabajar con herramientas como Docker, Kubernetes, y configurar infraestructuras en la nube.',
    salary: 90000 # Ejemplo de salario
  },
  {
    title: 'Especialista en Seguridad de la Información',
    description: 'Buscamos un/a especialista en seguridad de la información para proteger nuestros sistemas y datos. Deberás realizar evaluaciones de vulnerabilidades, implementar medidas de seguridad y responder a incidentes.',
    salary: 85000 # Ejemplo de salario
  },
  {
    title: 'Analista de Negocios Senior',
    description: 'Buscamos un/a analista de negocios senior para traducir las necesidades del negocio en requerimientos funcionales. Deberás colaborar con equipos de desarrollo y realizar análisis de impacto.',
    salary: 75000 # Ejemplo de salario
  },
  {
    title: 'Especialista en Marketing Digital',
    description: 'Buscamos un/a especialista en marketing digital para gestionar nuestras campañas en redes sociales y SEO. Deberás analizar el rendimiento de las campañas y optimizar los resultados.',
    salary: 60000 # Ejemplo de salario
  },
  {
    title: 'Desarrollador/a Backend Senior (Python)',
    description: 'Buscamos un/a desarrollador/a backend senior para construir APIs robustas y escalables. Deberás tener experiencia en frameworks como Django o Flask, y conocimientos en bases de datos relacionales y no relacionales.',
    salary: 95000 # Ejemplo de salario
  },
  {
    title: 'Especialista en Cloud Computing (AWS)',
    description: 'Buscamos un/a especialista en cloud computing (AWS) para diseñar y gestionar nuestra infraestructura en la nube. Deberás tener experiencia en servicios como EC2, S3, RDS, y Lambda.',
    salary: 88000 # Ejemplo de salario
  },
  {
    title: 'Ingeniero/a de Datos Senior',
    description: 'Buscamos un/a ingeniero/a de datos senior para construir y mantener nuestras infraestructuras de datos. Deberás tener experiencia en ETL, data warehousing y herramientas como Apache Spark.',
    salary: 92000 # Ejemplo de salario
  }
]

admin = User.find_by(admin: true)

joboffers_data.each do |job|
  job[:user_id] = admin.id # Asignar el ID del usuario administrador
  Joboffer.create!(job)
end