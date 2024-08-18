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

ActiveRecord::Schema[7.1].define(version: 2024_08_18_000047) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "annotations", force: :cascade do |t|
    t.bigint "document_id", null: false
    t.integer "page_number", null: false
    t.text "selected_text", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "bounding_x1"
    t.float "bounding_y1"
    t.float "bounding_x2"
    t.float "bounding_y2"
    t.float "bounding_width"
    t.float "bounding_height"
    t.jsonb "rects", default: []
    t.integer "annotation_type"
    t.index ["document_id"], name: "index_annotations_on_document_id"
  end

  create_table "audit_logs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "document_id"
    t.bigint "beta_reader_invite_id"
    t.integer "action", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beta_reader_invite_id"], name: "index_audit_logs_on_beta_reader_invite_id"
    t.index ["document_id"], name: "index_audit_logs_on_document_id"
    t.index ["user_id"], name: "index_audit_logs_on_user_id"
  end

  create_table "beta_reader_invites", force: :cascade do |t|
    t.bigint "inviter_id"
    t.bigint "invitee_id"
    t.string "email", null: false
    t.integer "status", default: 0
    t.bigint "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_beta_reader_invites_on_document_id"
    t.index ["invitee_id"], name: "index_beta_reader_invites_on_invitee_id"
    t.index ["inviter_id"], name: "index_beta_reader_invites_on_inviter_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "annotation_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["annotation_id"], name: "index_comments_on_annotation_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "title"
    t.string "hosted_url"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_documents_on_owner_id"
  end

  create_table "email_events", force: :cascade do |t|
    t.integer "event_type"
    t.integer "device_type"
    t.integer "email_client"
    t.string "geolocation"
    t.jsonb "additional_data"
    t.bigint "email_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_id"], name: "index_email_events_on_email_id"
  end

  create_table "emails", force: :cascade do |t|
    t.string "name"
    t.string "preview_link", default: ""
    t.string "subject"
    t.string "body"
    t.datetime "sent_at"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_emails_on_user_id"
  end

  create_table "ndas", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "document_id"
    t.datetime "signed_at"
    t.integer "signed", default: 0
    t.string "pdf_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_ndas_on_document_id"
    t.index ["user_id"], name: "index_ndas_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "plan", default: 0, null: false
    t.integer "documents_remaining", default: 0
    t.integer "invites_remaining", default: 0
    t.string "stripe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "auth_id"
    t.integer "role", default: 0, null: false
    t.bigint "invited_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
  end

  add_foreign_key "annotations", "documents"
  add_foreign_key "audit_logs", "beta_reader_invites"
  add_foreign_key "audit_logs", "documents"
  add_foreign_key "audit_logs", "users"
  add_foreign_key "beta_reader_invites", "documents"
  add_foreign_key "beta_reader_invites", "users", column: "invitee_id"
  add_foreign_key "beta_reader_invites", "users", column: "inviter_id"
  add_foreign_key "comments", "annotations"
  add_foreign_key "comments", "users"
  add_foreign_key "documents", "users", column: "owner_id"
  add_foreign_key "email_events", "emails"
  add_foreign_key "emails", "users"
  add_foreign_key "ndas", "documents"
  add_foreign_key "ndas", "users"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "users", "users", column: "invited_by_id"
end
