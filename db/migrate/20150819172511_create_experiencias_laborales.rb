class CreateExperienciasLaborales < ActiveRecord::Migration
  def change
    create_table :experiencias_laborales do |t|
      t.string :empresa
      t.string :cargo
      t.string :telefono
      t.date :fecha_inicio
      t.date :fecha_terminacion
      t.references :user, index: true

      t.timestamps
    end
  end
end


