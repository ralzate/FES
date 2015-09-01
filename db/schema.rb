# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150828172307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrar_usuarios", force: true do |t|
    t.integer  "rol_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "administrar_usuarios", ["rol_id"], name: "index_administrar_usuarios_on_rol_id", using: :btree
  add_index "administrar_usuarios", ["user_id"], name: "index_administrar_usuarios_on_user_id", using: :btree

  create_table "curriculums", force: true do |t|
    t.string   "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estudios_complementarios", force: true do |t|
    t.string   "nombre"
    t.string   "entidad"
    t.date     "fecha_terminacion"
    t.time     "intensidad_horaria"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "estudios_complementarios", ["user_id"], name: "index_estudios_complementarios_on_user_id", using: :btree

  create_table "experiencias_laborales", force: true do |t|
    t.string   "empresa"
    t.string   "cargo"
    t.string   "telefono"
    t.date     "fecha_inicio"
    t.date     "fecha_terminacion"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "experiencias_laborales", ["user_id"], name: "index_experiencias_laborales_on_user_id", using: :btree

  create_table "informaciones_academicas", force: true do |t|
    t.string   "tipo_de_dato"
    t.string   "nombre"
    t.date     "fecha_terminacion"
    t.string   "titulo_obtenido"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "informaciones_academicas", ["user_id"], name: "index_informaciones_academicas_on_user_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profesiones", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "referencias_personales", force: true do |t|
    t.string   "nombre"
    t.string   "telefono"
    t.string   "profesion"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "referencias_personales", ["user_id"], name: "index_referencias_personales_on_user_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "nombre1",                default: "", null: false
    t.string   "nombre2",                default: "", null: false
    t.string   "apellido1",              default: "", null: false
    t.string   "apellido2",              default: "", null: false
    t.string   "cedula",                 default: "", null: false
    t.integer  "genero",                 default: 0,  null: false
    t.integer  "profesion_id",           default: 0,  null: false
    t.integer  "rol_id"
    t.string   "profesion",              default: "", null: false
    t.string   "tarjeta_profesional",    default: "", null: false
    t.string   "estado_civil",           default: "", null: false
    t.string   "direccion",              default: "", null: false
    t.date     "fecha_nacimiento"
    t.string   "celular",                default: "", null: false
    t.string   "telefono",               default: "", null: false
    t.text     "perfil",                 default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["profesion_id"], name: "index_users_on_profesion_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
