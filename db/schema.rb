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

ActiveRecord::Schema.define(version: 20130625192625) do

  create_table "cart_items", force: true do |t|
    t.integer "cart_id",      null: false
    t.integer "committee_id", null: false
    t.integer "amount_cents"
    t.float   "proportion"
  end

  add_index "cart_items", ["cart_id", "committee_id"], name: "index_cart_items_on_cart_id_and_committee_id", unique: true, using: :btree

  create_table "carts", force: true do |t|
    t.integer  "user_id"
    t.integer  "disbursement_id"
    t.string   "state"
    t.integer  "cart_items_count", default: 0
    t.integer  "total_cents"
    t.integer  "currency"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "carts", ["user_id"], name: "index_carts_on_user_id", using: :btree

  create_table "committees", force: true do |t|
    t.integer  "legal_committee_id"
    t.string   "legal_committee_type"
    t.string   "jurisdiction",                               null: false
    t.string   "acronym"
    t.string   "short_name"
    t.string   "full_name",                                  null: false
    t.string   "type"
    t.string   "legal_id"
    t.string   "corporation_acronym"
    t.string   "corporation_full_name"
    t.string   "corporation_type"
    t.string   "corporation_ein"
    t.string   "contact_name"
    t.string   "contact_title"
    t.string   "email"
    t.string   "phone"
    t.string   "url"
    t.string   "party"
    t.string   "address"
    t.string   "paypal_email"
    t.string   "status"
    t.text     "notes"
    t.boolean  "foreign_contributions_okay", default: false
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fec_candidates", force: true do |t|
    t.string   "fec_id",                       limit: 9,              null: false
    t.string   "name",                         limit: 38
    t.string   "party",                        limit: 3
    t.string   "party_2",                      limit: 3
    t.string   "incumbent_challenger",         limit: 1
    t.string   "status",                       limit: 1
    t.string   "street_1",                     limit: 34
    t.string   "street_2",                     limit: 34
    t.string   "city",                         limit: 18
    t.string   "state",                        limit: 2
    t.string   "zip",                          limit: 5
    t.string   "principal_campaign_committee", limit: 9
    t.string   "year",                         limit: 2
    t.string   "district",                     limit: 2
    t.integer  "last_update_year"
    t.integer  "lock_version",                            default: 0
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "fec_candidates", ["district"], name: "index_fec_candidates_on_district", using: :btree
  add_index "fec_candidates", ["fec_id"], name: "index_fec_candidates_on_fec_id", unique: true, using: :btree
  add_index "fec_candidates", ["incumbent_challenger"], name: "index_fec_candidates_on_incumbent_challenger", using: :btree
  add_index "fec_candidates", ["name"], name: "index_fec_candidates_on_name", using: :btree
  add_index "fec_candidates", ["party"], name: "index_fec_candidates_on_party", using: :btree
  add_index "fec_candidates", ["party_2"], name: "index_fec_candidates_on_party_2", using: :btree
  add_index "fec_candidates", ["principal_campaign_committee"], name: "index_fec_candidates_on_principal_campaign_committee", using: :btree
  add_index "fec_candidates", ["state", "city"], name: "index_fec_candidates_on_state_and_city", using: :btree
  add_index "fec_candidates", ["status"], name: "index_fec_candidates_on_status", using: :btree
  add_index "fec_candidates", ["updated_at"], name: "index_fec_candidates_on_updated_at", using: :btree
  add_index "fec_candidates", ["year"], name: "index_fec_candidates_on_year", using: :btree

  create_table "fec_committees", force: true do |t|
    t.string   "fec_id",                      limit: 9,              null: false
    t.string   "name",                        limit: 90,             null: false
    t.string   "treasurer_name",              limit: 38
    t.string   "street_1",                    limit: 34
    t.string   "street_2",                    limit: 34
    t.string   "city",                        limit: 18
    t.string   "state",                       limit: 2
    t.string   "zip",                         limit: 5
    t.string   "designation",                 limit: 1
    t.string   "type",                        limit: 1
    t.string   "party",                       limit: 3
    t.string   "filing_frequency",            limit: 1
    t.string   "interest_group_category",     limit: 1
    t.string   "connected_organization_name", limit: 38
    t.string   "candidate_id",                limit: 9
    t.integer  "last_update_year"
    t.integer  "lock_version",                           default: 0
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "fec_committees", ["candidate_id"], name: "index_fec_committees_on_candidate_id", using: :btree
  add_index "fec_committees", ["connected_organization_name"], name: "index_fec_committees_on_connected_organization_name", using: :btree
  add_index "fec_committees", ["designation"], name: "index_fec_committees_on_designation", using: :btree
  add_index "fec_committees", ["fec_id"], name: "index_fec_committees_on_fec_id", unique: true, using: :btree
  add_index "fec_committees", ["interest_group_category"], name: "index_fec_committees_on_interest_group_category", using: :btree
  add_index "fec_committees", ["name"], name: "index_fec_committees_on_name", using: :btree
  add_index "fec_committees", ["party"], name: "index_fec_committees_on_party", using: :btree
  add_index "fec_committees", ["state", "city"], name: "index_fec_committees_on_state_and_city", using: :btree
  add_index "fec_committees", ["treasurer_name"], name: "index_fec_committees_on_treasurer_name", using: :btree
  add_index "fec_committees", ["updated_at"], name: "index_fec_committees_on_updated_at", using: :btree

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider",                 null: false
    t.string   "uid",                      null: false
    t.string   "name"
    t.string   "email"
    t.string   "nickname"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.text     "description"
    t.string   "image"
    t.string   "phone"
    t.text     "urls"
    t.string   "token"
    t.string   "secret"
    t.text     "raw_info"
    t.integer  "lock_version", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

  add_index "identities", ["email"], name: "index_identities_on_email", using: :btree
  add_index "identities", ["name"], name: "index_identities_on_name", using: :btree
  add_index "identities", ["nickname"], name: "index_identities_on_nickname", using: :btree
  add_index "identities", ["provider", "uid"], name: "index_identities_on_provider_and_uid", unique: true, using: :btree
  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "initiative_support", force: true do |t|
    t.integer  "initiative_id",                 null: false
    t.integer  "committee_id",                  null: false
    t.boolean  "support"
    t.boolean  "primary",       default: false
    t.text     "statement"
    t.string   "url"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "initiatives", force: true do |t|
    t.string   "jurisdiction",                    null: false
    t.date     "election_date"
    t.string   "election_type",        limit: 15
    t.string   "status"
    t.string   "initiator_type",       limit: 30
    t.string   "initiative_type",      limit: 30
    t.boolean  "indirect"
    t.string   "initiative_name"
    t.string   "proposition_name"
    t.string   "title",                           null: false
    t.string   "informal_title"
    t.text     "short_summary"
    t.text     "summary"
    t.text     "analysis"
    t.text     "text"
    t.string   "wikipedia_url"
    t.string   "ballotpedia_url"
    t.date     "filing_date"
    t.date     "summary_date"
    t.date     "circulation_deadline"
    t.date     "full_check_deadline"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "initiatives", ["election_date"], name: "index_initiatives_on_election_date", using: :btree
  add_index "initiatives", ["election_type"], name: "index_initiatives_on_election_type", using: :btree
  add_index "initiatives", ["initiative_name"], name: "index_initiatives_on_initiative_name", using: :btree
  add_index "initiatives", ["jurisdiction"], name: "index_initiatives_on_jurisdiction", using: :btree
  add_index "initiatives", ["proposition_name"], name: "index_initiatives_on_proposition_name", using: :btree
  add_index "initiatives", ["status"], name: "index_initiatives_on_status", using: :btree
  add_index "initiatives", ["title"], name: "index_initiatives_on_title", using: :btree

  create_table "ny_voters", force: true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "name_suffix"
    t.string   "residence_house_number"
    t.string   "residence_fractional_number"
    t.string   "residence_apartment"
    t.string   "residence_pre_street_direction"
    t.string   "residence_street_name"
    t.string   "residence_post_street_direction"
    t.string   "residence_city"
    t.string   "residence_zip5"
    t.string   "residence_zip4"
    t.string   "mailing_address_1"
    t.string   "mailing_address_2"
    t.string   "mailing_address_3"
    t.string   "mailing_address_4"
    t.string   "dob"
    t.string   "gender"
    t.string   "enrollment"
    t.string   "other_party"
    t.integer  "county_code"
    t.integer  "election_district"
    t.integer  "legislative_district"
    t.string   "town_city"
    t.string   "ward"
    t.integer  "congressional_district"
    t.integer  "senate_district"
    t.integer  "assembly_district"
    t.string   "last_date_voted"
    t.string   "last_year_voted"
    t.string   "last_county_voted"
    t.string   "last_registered_address"
    t.string   "last_registered_name"
    t.string   "county_voter_registration_number"
    t.string   "application_date"
    t.string   "application_source"
    t.string   "id_required"
    t.string   "id_verification_met"
    t.string   "status"
    t.string   "reason"
    t.string   "inactive_date"
    t.string   "purged_date"
    t.string   "voter_id"
    t.text     "voter_history"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ny_voters", ["assembly_district"], name: "index_ny_voters_on_assembly_district", using: :btree
  add_index "ny_voters", ["congressional_district"], name: "index_ny_voters_on_congressional_district", using: :btree
  add_index "ny_voters", ["county_code"], name: "index_ny_voters_on_county_code", using: :btree
  add_index "ny_voters", ["county_voter_registration_number"], name: "index_ny_voters_on_county_voter_registration_number", using: :btree
  add_index "ny_voters", ["dob"], name: "index_ny_voters_on_dob", using: :btree
  add_index "ny_voters", ["election_district"], name: "index_ny_voters_on_election_district", using: :btree
  add_index "ny_voters", ["enrollment", "other_party"], name: "index_ny_voters_on_enrollment_and_other_party", using: :btree
  add_index "ny_voters", ["first_name"], name: "index_ny_voters_on_first_name", using: :btree
  add_index "ny_voters", ["last_name", "first_name"], name: "index_ny_voters_on_last_name_and_first_name", using: :btree
  add_index "ny_voters", ["legislative_district"], name: "index_ny_voters_on_legislative_district", using: :btree
  add_index "ny_voters", ["residence_city"], name: "index_ny_voters_on_residence_city", using: :btree
  add_index "ny_voters", ["residence_zip5", "residence_zip4"], name: "index_ny_voters_on_residence_zip5_and_residence_zip4", using: :btree
  add_index "ny_voters", ["senate_district"], name: "index_ny_voters_on_senate_district", using: :btree
  add_index "ny_voters", ["status", "reason"], name: "index_ny_voters_on_status_and_reason", using: :btree
  add_index "ny_voters", ["town_city"], name: "index_ny_voters_on_town_city", using: :btree
  add_index "ny_voters", ["voter_id"], name: "index_ny_voters_on_voter_id", unique: true, using: :btree
  add_index "ny_voters", ["ward"], name: "index_ny_voters_on_ward", using: :btree

  create_table "paypal_notifications", force: true do |t|
    t.integer  "transaction_id"
    t.boolean  "legit"
    t.boolean  "test"
    t.string   "pay_key"
    t.string   "status",         limit: 20
    t.text     "details_json"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "paypal_notifications", ["legit"], name: "index_paypal_notifications_on_legit", using: :btree
  add_index "paypal_notifications", ["pay_key"], name: "index_paypal_notifications_on_pay_key", using: :btree
  add_index "paypal_notifications", ["status"], name: "index_paypal_notifications_on_status", using: :btree
  add_index "paypal_notifications", ["transaction_id"], name: "index_paypal_notifications_on_transaction_id", using: :btree

  create_table "paypal_subtransactions", force: true do |t|
    t.integer  "user_id"
    t.integer  "transaction_id",                                   null: false
    t.string   "paypal_transaction_id"
    t.string   "sender_transaction_id"
    t.string   "receiver"
    t.integer  "amount_cents",                                     null: false
    t.string   "currency",              limit: 3,  default: "USD", null: false
    t.string   "status",                limit: 20
    t.string   "sender_status",         limit: 20
    t.integer  "refunded_amount_cents"
    t.boolean  "pending_refund"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "paypal_subtransactions", ["currency", "amount_cents"], name: "index_paypal_subtransactions_on_currency_and_amount_cents", using: :btree
  add_index "paypal_subtransactions", ["paypal_transaction_id"], name: "index_paypal_subtransactions_on_paypal_transaction_id", using: :btree
  add_index "paypal_subtransactions", ["pending_refund"], name: "index_paypal_subtransactions_on_pending_refund", using: :btree
  add_index "paypal_subtransactions", ["receiver"], name: "index_paypal_subtransactions_on_receiver", using: :btree
  add_index "paypal_subtransactions", ["sender_status"], name: "index_paypal_subtransactions_on_sender_status", using: :btree
  add_index "paypal_subtransactions", ["sender_transaction_id"], name: "index_paypal_subtransactions_on_sender_transaction_id", using: :btree
  add_index "paypal_subtransactions", ["status"], name: "index_paypal_subtransactions_on_status", using: :btree
  add_index "paypal_subtransactions", ["transaction_id"], name: "index_paypal_subtransactions_on_transaction_id", using: :btree
  add_index "paypal_subtransactions", ["user_id"], name: "index_paypal_subtransactions_on_user_id", using: :btree

  create_table "paypal_transaction_notifications", force: true do |t|
    t.integer  "subtransaction_id"
    t.boolean  "legit"
    t.boolean  "test"
    t.string   "paypal_transaction_id",            null: false
    t.string   "status",                limit: 20
    t.text     "details_json"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "paypal_transaction_notifications", ["legit"], name: "index_paypal_transaction_notifications_on_legit", using: :btree
  add_index "paypal_transaction_notifications", ["paypal_transaction_id"], name: "index_paypal_transaction_notifications_on_paypal_transaction_id", using: :btree
  add_index "paypal_transaction_notifications", ["status"], name: "index_paypal_transaction_notifications_on_status", using: :btree
  add_index "paypal_transaction_notifications", ["subtransaction_id"], name: "index_paypal_transaction_notifications_on_subtransaction_id", using: :btree

  create_table "paypal_transactions", force: true do |t|
    t.integer  "user_id"
    t.string   "source"
    t.string   "pay_key"
    t.integer  "amount_cents",                              null: false
    t.string   "currency",       limit: 3,  default: "USD", null: false
    t.string   "status",         limit: 20
    t.text     "details_json"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "correlation_id"
    t.string   "memo"
  end

  add_index "paypal_transactions", ["correlation_id"], name: "index_paypal_transactions_on_correlation_id", using: :btree
  add_index "paypal_transactions", ["currency", "amount_cents"], name: "index_paypal_transactions_on_currency_and_amount_cents", using: :btree
  add_index "paypal_transactions", ["source"], name: "index_paypal_transactions_on_source", using: :btree
  add_index "paypal_transactions", ["status"], name: "index_paypal_transactions_on_status", using: :btree
  add_index "paypal_transactions", ["user_id"], name: "index_paypal_transactions_on_user_id", using: :btree

  create_table "sessions", force: true do |t|
    t.string   "session_id",               null: false
    t.text     "data"
    t.integer  "lock_version", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "stripe_accounts", force: true do |t|
    t.string  "stripe_id",            null: false
    t.boolean "charge_enabled",       null: false
    t.string  "currencies_enabled",   null: false
    t.boolean "details_submitted",    null: false
    t.boolean "transfer_enabled",     null: false
    t.string  "email",                null: false
    t.string  "statement_descriptor"
  end

  create_table "stripe_bank_accounts", force: true do |t|
    t.string  "stripe_id",             null: false
    t.string  "bank_name"
    t.string  "country",     limit: 2
    t.string  "last4"
    t.string  "fingerprint"
    t.boolean "validated"
  end

  create_table "stripe_cards", force: true do |t|
    t.integer  "exp_month",           limit: 1,  null: false
    t.integer  "exp_year",            limit: 2,  null: false
    t.string   "fingerprint",                    null: false
    t.string   "last4",               limit: 4,  null: false
    t.string   "type",                limit: 20, null: false
    t.string   "address_city"
    t.string   "address_country"
    t.string   "address_line1"
    t.string   "adress_line2"
    t.string   "address_state"
    t.string   "address_zip"
    t.boolean  "address_line1_check"
    t.boolean  "address_zip_check"
    t.boolean  "cvc_check"
    t.string   "country",             limit: 2
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stripe_charges", force: true do |t|
    t.string   "stripe_id"
    t.boolean  "test"
    t.integer  "amount"
    t.boolean  "captured"
    t.integer  "stripe_card_id"
    t.datetime "stripe_created_at"
    t.string   "currency",           default: "usd"
    t.integer  "fee_amount"
    t.integer  "stripe_fee_id"
    t.boolean  "paid"
    t.boolean  "refunded"
    t.integer  "amount_refunded"
    t.integer  "stripe_customer_id"
    t.string   "description"
    t.string   "failure_code"
    t.string   "failure_message"
    t.integer  "stripe_invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stripe_coupons", force: true do |t|
    t.string   "stripe_id",                                    null: false
    t.boolean  "test",                                         null: false
    t.string   "duration",                                     null: false
    t.integer  "amount_off"
    t.string   "currency",           limit: 3, default: "usd"
    t.integer  "duration_in_months"
    t.integer  "max_redemptions"
    t.integer  "percent_off",        limit: 1
    t.datetime "redeem_by"
    t.integer  "times_redeemed",               default: 0,     null: false
  end

  create_table "stripe_customers", force: true do |t|
    t.string   "stripe_id",                              null: false
    t.boolean  "test",                                   null: false
    t.datetime "stripe_created_at",                      null: false
    t.integer  "account_balance",        default: 0,     null: false
    t.integer  "stripe_card_id",                         null: false
    t.boolean  "delinquent",             default: false, null: false
    t.string   "description"
    t.integer  "stripe_discount_id"
    t.string   "email"
    t.integer  "stripe_subscription_id"
    t.boolean  "deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stripe_discounts", force: true do |t|
    t.integer  "stripe_coupon_id",   null: false
    t.integer  "stripe_customer_id", null: false
    t.datetime "start",              null: false
    t.datetime "end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stripe_disputes", force: true do |t|
    t.boolean  "test",                                         null: false
    t.integer  "amount",                                       null: false
    t.integer  "stripe_charge_id",                             null: false
    t.datetime "stripe_created_at",                            null: false
    t.string   "currency",          limit: 3,  default: "usd", null: false
    t.string   "reason",            limit: 25,                 null: false
    t.string   "status",            limit: 15,                 null: false
    t.text     "evidence"
    t.datetime "evidence_due_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stripe_events", force: true do |t|
    t.string   "stripe_id",                       null: false
    t.boolean  "test",                            null: false
    t.datetime "stripe_created_at",               null: false
    t.integer  "pending_webhooks",    default: 0, null: false
    t.string   "type"
    t.string   "request"
    t.text     "object"
    t.text     "previous_attributes"
  end

  create_table "stripe_fees", force: true do |t|
    t.integer  "amount",                                    null: false
    t.string   "currency",        limit: 3, default: "usd", null: false
    t.string   "type",                                      null: false
    t.integer  "amount_refunded"
    t.string   "application"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stripe_invoice_lines", force: true do |t|
    t.integer  "stripe_invoice_id_id"
    t.integer  "stripe_customer_id_id",                            null: false
    t.string   "stripe_id"
    t.boolean  "test",                                             null: false
    t.integer  "amount",                                           null: false
    t.string   "currency",                         default: "usd", null: false
    t.string   "type",                  limit: 15
    t.string   "description"
    t.integer  "stripe_plan_id"
    t.integer  "quantity"
    t.datetime "period_start"
    t.datetime "period_end"
    t.boolean  "proration"
  end

  create_table "stripe_invoices", force: true do |t|
    t.string   "stripe_id",                                      null: false
    t.boolean  "test",                                           null: false
    t.integer  "amount_due",                                     null: false
    t.integer  "attempt_count",                                  null: false
    t.boolean  "attempted",                      default: false, null: false
    t.boolean  "closed",                         default: false, null: false
    t.string   "currency",             limit: 3, default: "usd", null: false
    t.integer  "stripe_customer_id"
    t.datetime "date"
    t.boolean  "paid",                           default: false, null: false
    t.datetime "period_end",                                     null: false
    t.datetime "period_start",                                   null: false
    t.integer  "starting_balance",                               null: false
    t.integer  "subtotal",                                       null: false
    t.integer  "total",                                          null: false
    t.integer  "stripe_charge_id"
    t.integer  "stripe_discount_id"
    t.integer  "ending_balance"
    t.datetime "next_payment_attempt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stripe_plans", force: true do |t|
    t.string   "stripe_id",                                   null: false
    t.boolean  "test",                                        null: false
    t.integer  "amount",                                      null: false
    t.string   "currency",          limit: 3, default: "usd", null: false
    t.string   "interval",          limit: 5,                 null: false
    t.integer  "interval_count",              default: 1,     null: false
    t.string   "name",                                        null: false
    t.integer  "trial_period_days"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stripe_recipients", force: true do |t|
    t.string   "stripe_id",                         null: false
    t.boolean  "test",                              null: false
    t.datetime "stripe_created_at"
    t.string   "type",                   limit: 15
    t.integer  "stripe_bank_account_id"
    t.string   "description"
    t.string   "email"
    t.string   "name"
  end

  create_table "stripe_subscriptions", force: true do |t|
    t.boolean  "cancel_at_period_end",            default: false, null: false
    t.integer  "stripe_customer_id",                              null: false
    t.integer  "stripe_plan_id",                                  null: false
    t.integer  "quantity",                        default: 1,     null: false
    t.datetime "start",                                           null: false
    t.string   "status",               limit: 10,                 null: false
    t.datetime "canceled_at"
    t.datetime "current_period_end",                              null: false
    t.datetime "current_period_start",                            null: false
    t.datetime "ended_at"
    t.datetime "trial_end"
    t.datetime "trial_start"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stripe_transfers", force: true do |t|
    t.string   "stripe_id",                                       null: false
    t.boolean  "test",                                            null: false
    t.integer  "amount",                                          null: false
    t.string   "currency",             limit: 3,  default: "usd", null: false
    t.datetime "date",                                            null: false
    t.integer  "fee",                                             null: false
    t.string   "status",               limit: 10,                 null: false
    t.string   "description"
    t.integer  "stripe_recipient_id"
    t.string   "statement_descriptor"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.string   "name",                                null: false
    t.string   "login",                               null: false
    t.integer  "lock_version",           default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unconfirmed_email"], name: "index_users_on_unconfirmed_email", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.string   "ip"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
  end

  add_index "versions", ["ip"], name: "index_versions_on_ip", using: :btree
  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  add_index "versions", ["whodunnit"], name: "index_versions_on_whodunnit", using: :btree

end
