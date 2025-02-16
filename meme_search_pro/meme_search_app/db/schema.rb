# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_02_16_140109) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "vector"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "image_cores", force: :cascade do |t|
    t.bigint "image_path_id", null: false
    t.string "name", limit: 100
    t.string "description", limit: 500
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_path_id"], name: "index_image_cores_on_image_path_id"
  end

  create_table "image_embeddings", force: :cascade do |t|
    t.bigint "image_core_id", null: false
    t.string "snippet"
    t.vector "embedding", limit: 384
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_core_id"], name: "index_image_embeddings_on_image_core_id"
  end

  create_table "image_paths", force: :cascade do |t|
    t.string "name", limit: 300
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_image_paths_on_name", unique: true
  end

  create_table "image_tags", force: :cascade do |t|
    t.bigint "image_core_id", null: false
    t.bigint "tag_name_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_core_id"], name: "index_image_tags_on_image_core_id"
    t.index ["tag_name_id"], name: "index_image_tags_on_tag_name_id"
  end

  create_table "image_to_texts", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "current", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_names", force: :cascade do |t|
    t.string "name", limit: 20
    t.string "color", limit: 20, default: "red"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tag_names_on_name", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "image_cores", "image_paths"
  add_foreign_key "image_embeddings", "image_cores"
  add_foreign_key "image_tags", "image_cores"
  add_foreign_key "image_tags", "tag_names"
end
