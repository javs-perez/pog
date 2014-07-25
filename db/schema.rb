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

ActiveRecord::Schema.define(version: 20140724223611) do

  create_table "addresses", force: true do |t|
    t.string   "street"
    t.string   "complement"
    t.string   "number"
    t.string   "village"
    t.string   "zip"
    t.string   "lat"
    t.string   "lng"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "analysts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "analyst"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: true
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "analysts", ["email"], name: "index_analysts_on_email", unique: true, using: :btree
  add_index "analysts", ["reset_password_token"], name: "index_analysts_on_reset_password_token", unique: true, using: :btree

  create_table "area_course_stats", force: true do |t|
    t.integer  "total",          default: 0
    t.integer  "area_report_id"
    t.integer  "course_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "area_course_stats", ["area_report_id"], name: "index_area_course_stats_on_area_report_id", using: :btree

  create_table "area_pastors", force: true do |t|
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "area_pastors_areas", id: false, force: true do |t|
    t.integer "area_pastor_id"
    t.integer "area_id"
  end

  add_index "area_pastors_areas", ["area_pastor_id", "area_id"], name: "area_pastors_areas", unique: true, using: :btree

  create_table "area_pastors_coordinators", id: false, force: true do |t|
    t.integer  "area_pastor_id"
    t.integer  "coordinator_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "area_pastors_presbyters", id: false, force: true do |t|
    t.integer  "area_pastor_id"
    t.integer  "presbyter_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "area_report_coordinations", force: true do |t|
    t.integer  "area_report_id"
    t.integer  "coordination_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "area_report_coordinations", ["area_report_id"], name: "index_area_report_coordinations_on_area_report_id", using: :btree
  add_index "area_report_coordinations", ["coordination_id"], name: "index_area_report_coordinations_on_coordination_id", using: :btree

  create_table "area_reports", force: true do |t|
    t.date     "month_year"
    t.decimal  "total_offering",                  precision: 10, scale: 2, default: 0.0
    t.integer  "total_cells",                                              default: 0
    t.integer  "total_supervisions",                                       default: 0
    t.integer  "total_coordinations",                                      default: 0
    t.integer  "total_collaborators",                                      default: 0
    t.integer  "total_attendees",                                          default: 0
    t.integer  "total_visitors",                                           default: 0
    t.integer  "total_children",                                           default: 0
    t.integer  "area_id"
    t.datetime "created_at",                                                             null: false
    t.datetime "updated_at",                                                             null: false
    t.integer  "total_incoordinations",                                    default: 0
    t.integer  "total_outcoordinations",                                   default: 0
    t.integer  "total_insupervisions",                                     default: 0
    t.integer  "total_outsupervisions",                                    default: 0
    t.integer  "total_incells",                                            default: 0
    t.integer  "total_outcells",                                           default: 0
    t.integer  "total_leader_late_reports",                                default: 0
    t.integer  "total_supervisor_late_reports",                            default: 0
    t.integer  "total_coordinator_late_reports",                           default: 0
    t.integer  "total_area_pastor_late_reports",                           default: 0
    t.integer  "total_no_age",                                             default: 0
    t.integer  "total_age_group1",                                         default: 0
    t.integer  "total_age_group2",                                         default: 0
    t.integer  "total_age_group3",                                         default: 0
    t.integer  "total_age_group4",                                         default: 0
    t.integer  "total_age_group5",                                         default: 0
    t.integer  "total_age_group6",                                         default: 0
    t.integer  "total_age_group7",                                         default: 0
    t.integer  "total_age_group8",                                         default: 0
    t.integer  "total_age_group9",                                         default: 0
    t.integer  "total_age_group10",                                        default: 0
    t.integer  "total_single",                                             default: 0
    t.integer  "total_married",                                            default: 0
    t.integer  "total_divorced",                                           default: 0
    t.integer  "total_separated",                                          default: 0
    t.integer  "total_concubinage",                                        default: 0
    t.integer  "total_widow",                                              default: 0
    t.integer  "total_civilunion",                                         default: 0
    t.integer  "church_type"
    t.integer  "total_male",                                               default: 0
    t.integer  "total_female",                                             default: 0
    t.integer  "total_leadership_visits",                                  default: 0
    t.integer  "total_delivered_reports",                                  default: 0
    t.integer  "total_leader_late_delivery",                               default: 0
    t.integer  "total_supervisor_late_delivery",                           default: 0
    t.integer  "total_coordinator_late_delivery",                          default: 0
    t.integer  "total_area_pastor_late_delivery",                          default: 0
  end

  add_index "area_reports", ["area_id"], name: "index_area_reports_on_area_id", using: :btree

  create_table "area_reports_church_reports", id: false, force: true do |t|
    t.integer "area_report_id"
    t.integer "church_report_id"
  end

  add_index "area_reports_church_reports", ["area_report_id", "church_report_id"], name: "index_area_reports_church_reports", unique: true, using: :btree

  create_table "area_role_stats", force: true do |t|
    t.integer  "total",          default: 0
    t.integer  "area_report_id"
    t.integer  "role_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "area_role_stats", ["area_report_id"], name: "index_area_role_stats_on_area_report_id", using: :btree

  create_table "areas", force: true do |t|
    t.string   "name",                        limit: 30
    t.boolean  "active",                                 default: true
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.boolean  "generate_stats",                         default: true
    t.integer  "district_id"
    t.date     "monthly_bday_sent_at"
    t.date     "statistics_generated_at"
    t.date     "statistics_sent_at"
    t.date     "generated_pending_report_at"
    t.date     "sent_pending_report_at"
  end

  add_index "areas", ["district_id"], name: "index_areas_on_district_id", using: :btree

  create_table "attendance_lessons", force: true do |t|
    t.integer  "attendee_id"
    t.integer  "lesson_id"
    t.boolean  "presence"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "attendees", force: true do |t|
    t.integer  "member_id"
    t.integer  "classroom_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "backups", force: true do |t|
    t.string   "password"
    t.integer  "status",                  default: 2
    t.boolean  "upload",                  default: false
    t.string   "upload_message"
    t.string   "compressed_file_name"
    t.string   "compressed_content_type"
    t.integer  "compressed_file_size"
    t.datetime "compressed_updated_at"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "cell_guests", force: true do |t|
    t.integer "guest_id"
    t.integer "cell_id"
  end

  add_index "cell_guests", ["guest_id", "cell_id"], name: "index_cell_guests_on_guest_id_and_cell_id", unique: true, using: :btree

  create_table "cell_meeting_guest_presences", force: true do |t|
    t.boolean  "presence",        default: false
    t.integer  "guest_id"
    t.integer  "cell_meeting_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "cell_meeting_presences", force: true do |t|
    t.boolean  "presence"
    t.integer  "member_id"
    t.integer  "cell_meeting_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "cell_meeting_visitor_presences", force: true do |t|
    t.boolean  "presence"
    t.integer  "member_id"
    t.integer  "cell_meeting_id"
    t.integer  "role_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "cell_meetings", force: true do |t|
    t.date     "date"
    t.string   "teacher"
    t.text     "comment"
    t.integer  "visitors"
    t.boolean  "add_to_statistics", default: true
    t.integer  "children",          default: 0
    t.integer  "cell_id"
    t.integer  "cell_report_id"
    t.integer  "theme_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "cell_prayer_reasons", force: true do |t|
    t.boolean  "pray"
    t.integer  "cell_report_id"
    t.integer  "config_prayer_reason_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "cell_reports", force: true do |t|
    t.date     "month_year"
    t.text     "assistance"
    t.text     "extra_activity"
    t.decimal  "offering",                  precision: 10, scale: 2, default: 0.0
    t.integer  "average_visitors",                                   default: 0
    t.integer  "average_attendees",                                  default: 0
    t.integer  "average_children",                                   default: 0
    t.integer  "total_average",                                      default: 0
    t.integer  "leader_id"
    t.boolean  "leader_aware",                                       default: false
    t.date     "leader_aware_date"
    t.text     "leader_obs"
    t.integer  "supervisor_id"
    t.boolean  "supervisor_aware",                                   default: false
    t.date     "supervisor_aware_date"
    t.text     "supervisor_obs"
    t.integer  "coordinator_id"
    t.boolean  "coordinator_aware",                                  default: false
    t.date     "coordinator_aware_date"
    t.text     "coordinator_obs"
    t.integer  "area_pastor_id"
    t.boolean  "area_pastor_aware",                                  default: false
    t.date     "area_pastor_aware_date"
    t.text     "area_pastor_obs"
    t.integer  "cell_id"
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
    t.integer  "church_type",                                        default: 4
    t.integer  "average_leadership_visits",                          default: 0
    t.integer  "total_visitors_insertions",                          default: 1
  end

  create_table "cell_reports_granted_area_pastors", id: false, force: true do |t|
    t.integer "cell_report_id"
    t.integer "area_pastor_id"
  end

  add_index "cell_reports_granted_area_pastors", ["cell_report_id", "area_pastor_id"], name: "index_cell_reports_granted_area_pastors", unique: true, using: :btree

  create_table "cell_reports_granted_coordinators", id: false, force: true do |t|
    t.integer "cell_report_id"
    t.integer "coordinator_id"
  end

  add_index "cell_reports_granted_coordinators", ["cell_report_id", "coordinator_id"], name: "index_cell_reports_granted_coordinators", unique: true, using: :btree

  create_table "cell_reports_granted_leaders", id: false, force: true do |t|
    t.integer "cell_report_id"
    t.integer "leader_id"
  end

  add_index "cell_reports_granted_leaders", ["cell_report_id", "leader_id"], name: "index_cell_reports_granted_leaders", unique: true, using: :btree

  create_table "cell_reports_granted_supervisors", id: false, force: true do |t|
    t.integer "cell_report_id"
    t.integer "supervisor_id"
  end

  add_index "cell_reports_granted_supervisors", ["cell_report_id", "supervisor_id"], name: "index_cell_reports_granted_supervisors", unique: true, using: :btree

  create_table "cell_tracking_members", force: true do |t|
    t.boolean  "presence",         default: false
    t.integer  "member_id"
    t.integer  "cell_tracking_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "cell_trackings", force: true do |t|
    t.date     "date"
    t.integer  "reason"
    t.boolean  "others"
    t.string   "others_names"
    t.text     "comment"
    t.integer  "cell_report_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "cell_types", force: true do |t|
    t.string   "title"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.boolean  "active",            default: true
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "cells", force: true do |t|
    t.string   "name",                        limit: 30
    t.integer  "weekday"
    t.integer  "hour",                                   default: 20
    t.integer  "minute",                                 default: 0
    t.integer  "address_id"
    t.integer  "cell_type_id"
    t.boolean  "active",                                 default: true
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.integer  "supervision_id"
    t.boolean  "remind_leader",                          default: true
    t.date     "start_late_report",                      default: '2014-07-01'
    t.boolean  "export",                                 default: false
    t.boolean  "auto_generate_report",                   default: true
    t.date     "monthly_bday_sent_at"
    t.date     "generated_report_at"
    t.date     "generated_pending_report_at"
    t.date     "sent_pending_report_at"
    t.integer  "total_visitors_insertions",              default: 1
  end

  create_table "cells_leaders", id: false, force: true do |t|
    t.integer "leader_id"
    t.integer "cell_id"
  end

  add_index "cells_leaders", ["leader_id", "cell_id"], name: "index_cells_leaders_on_leader_id_and_cell_id", unique: true, using: :btree

  create_table "church_reports", force: true do |t|
    t.date     "month_year"
    t.string   "report_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "report_id"
  end

  create_table "church_reports_coordination_reports", id: false, force: true do |t|
    t.integer "church_report_id"
    t.integer "coordination_report_id"
  end

  add_index "church_reports_coordination_reports", ["church_report_id", "coordination_report_id"], name: "index_church_reports_coordination_reports", unique: true, using: :btree

  create_table "church_reports_district_reports", force: true do |t|
    t.integer  "church_report_id"
    t.integer  "district_report_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "church_reports_district_reports", ["church_report_id", "district_report_id"], name: "index_church_reports_district_reports", unique: true, using: :btree

  create_table "church_reports_supervision_reports", id: false, force: true do |t|
    t.integer "church_report_id"
    t.integer "supervision_report_id"
  end

  add_index "church_reports_supervision_reports", ["church_report_id", "supervision_report_id"], name: "index_church_reports_supervision_reports", unique: true, using: :btree

  create_table "church_structures", force: true do |t|
    t.integer  "superior_id"
    t.integer  "subordinate_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "church_structures", ["subordinate_id"], name: "index_church_structures_on_subordinate_id", using: :btree

  create_table "cities", force: true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classrooms", force: true do |t|
    t.integer  "course_id"
    t.integer  "attendance"
    t.datetime "start_date"
    t.integer  "lessons_quantity"
    t.integer  "status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "config_deactivation_reasons", force: true do |t|
    t.string   "reason"
    t.integer  "reason_for", default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "config_masters", force: true do |t|
    t.string   "church_main_name"
    t.string   "church_secondary_name"
    t.boolean  "only_secretary_can_add_collaborator",  default: true
    t.integer  "church_type",                          default: 1
    t.integer  "members_per_page",                     default: 10
    t.integer  "leaders_per_page",                     default: 10
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.string   "angel_file_name"
    t.string   "angel_content_type"
    t.integer  "angel_file_size"
    t.datetime "angel_updated_at"
    t.string   "locale",                               default: "pt-BR"
    t.string   "string",                               default: "pt-BR"
    t.datetime "created_at",                                                           null: false
    t.datetime "updated_at",                                                           null: false
    t.boolean  "send_bday_message",                    default: false
    t.boolean  "send_bday_tip_message",                default: true
    t.integer  "letter_id"
    t.integer  "late_leader_report",                   default: 5
    t.integer  "late_supervisor_report",               default: 2
    t.integer  "late_coordinator_report",              default: 2
    t.integer  "late_area_pastor_report",              default: 2
    t.boolean  "notify_senior_pastor_of_late_reports", default: true
    t.boolean  "notify_senior_pastor_of_bdays",        default: true
    t.datetime "daily_tasks",                          default: '2014-07-09 17:54:03'
    t.datetime "weekly_tasks",                         default: '2014-07-02 17:54:03'
    t.boolean  "allow_stats_recalculation",            default: true
    t.boolean  "generating_statistics",                default: false
    t.boolean  "block_download",                       default: false
    t.boolean  "auto_generate_report",                 default: true
  end

  create_table "config_more_infos", force: true do |t|
    t.string   "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "config_prayer_reasons", force: true do |t|
    t.string   "prayer_reason"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "coordination_course_stats", force: true do |t|
    t.integer  "total",                  default: 0
    t.integer  "coordination_report_id"
    t.integer  "course_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "coordination_course_stats", ["coordination_report_id"], name: "index_coordination_course_stats_on_coordination_report_id", using: :btree

  create_table "coordination_report_supervisions", force: true do |t|
    t.integer  "coordination_report_id"
    t.integer  "supervision_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "coordination_report_supervisions", ["coordination_report_id"], name: "index_coordination_report_supervisions_on_coordination_report_id", using: :btree
  add_index "coordination_report_supervisions", ["supervision_id"], name: "index_coordination_report_supervisions_on_supervision_id", using: :btree

  create_table "coordination_reports", force: true do |t|
    t.date     "month_year"
    t.decimal  "total_offering",                  precision: 10, scale: 2, default: 0.0
    t.integer  "total_supervisions",                                       default: 0
    t.integer  "total_cells",                                              default: 0
    t.integer  "total_collaborators",                                      default: 0
    t.integer  "total_attendees",                                          default: 0
    t.integer  "total_visitors",                                           default: 0
    t.integer  "total_children",                                           default: 0
    t.integer  "coordination_id"
    t.datetime "created_at",                                                             null: false
    t.datetime "updated_at",                                                             null: false
    t.integer  "total_insupervisions",                                     default: 0
    t.integer  "total_outsupervisions",                                    default: 0
    t.integer  "total_incells",                                            default: 0
    t.integer  "total_outcells",                                           default: 0
    t.integer  "total_leader_late_reports",                                default: 0
    t.integer  "total_supervisor_late_reports",                            default: 0
    t.integer  "total_coordinator_late_reports",                           default: 0
    t.integer  "total_no_age",                                             default: 0
    t.integer  "total_age_group1",                                         default: 0
    t.integer  "total_age_group2",                                         default: 0
    t.integer  "total_age_group3",                                         default: 0
    t.integer  "total_age_group4",                                         default: 0
    t.integer  "total_age_group5",                                         default: 0
    t.integer  "total_age_group6",                                         default: 0
    t.integer  "total_age_group7",                                         default: 0
    t.integer  "total_age_group8",                                         default: 0
    t.integer  "total_age_group9",                                         default: 0
    t.integer  "total_age_group10",                                        default: 0
    t.integer  "total_single",                                             default: 0
    t.integer  "total_married",                                            default: 0
    t.integer  "total_divorced",                                           default: 0
    t.integer  "total_separated",                                          default: 0
    t.integer  "total_concubinage",                                        default: 0
    t.integer  "total_widow",                                              default: 0
    t.integer  "total_civilunion",                                         default: 0
    t.integer  "church_type"
    t.integer  "total_male",                                               default: 0
    t.integer  "total_female",                                             default: 0
    t.integer  "total_leadership_visits",                                  default: 0
    t.integer  "total_delivered_reports",                                  default: 0
    t.integer  "total_area_pastor_late_reports",                           default: 0
    t.integer  "total_leader_late_delivery",                               default: 0
    t.integer  "total_supervisor_late_delivery",                           default: 0
    t.integer  "total_coordinator_late_delivery",                          default: 0
    t.integer  "total_area_pastor_late_delivery",                          default: 0
  end

  add_index "coordination_reports", ["coordination_id"], name: "index_coordination_reports_on_coordination_id", using: :btree

  create_table "coordination_role_stats", force: true do |t|
    t.integer  "total",                  default: 0
    t.integer  "coordination_report_id"
    t.integer  "role_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "coordination_role_stats", ["coordination_report_id"], name: "index_coordination_role_stats_on_coordination_report_id", using: :btree

  create_table "coordinations", force: true do |t|
    t.string   "name",                        limit: 30
    t.boolean  "active",                                 default: true
    t.integer  "area_id"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.boolean  "generate_stats",                         default: true
    t.date     "monthly_bday_sent_at"
    t.date     "statistics_generated_at"
    t.date     "statistics_sent_at"
    t.date     "generated_pending_report_at"
    t.date     "sent_pending_report_at"
  end

  add_index "coordinations", ["area_id"], name: "index_coordinations_on_area_id", using: :btree

  create_table "coordinations_coordinators", id: false, force: true do |t|
    t.integer "coordination_id"
    t.integer "coordinator_id"
  end

  add_index "coordinations_coordinators", ["coordination_id", "coordinator_id"], name: "coord_coord", unique: true, using: :btree

  create_table "coordinators", force: true do |t|
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coordinators_supervisors", id: false, force: true do |t|
    t.integer  "coordinator_id"
    t.integer  "supervisor_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "countries", force: true do |t|
    t.string   "code",       limit: 2
    t.string   "name"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "course_pre_reqs", id: false, force: true do |t|
    t.integer  "course_id"
    t.integer  "pre_req_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.integer  "attendance_default"
    t.integer  "lessons_quantity_defaut"
    t.string   "abbreviation",            limit: 3
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "courses_members", id: false, force: true do |t|
    t.integer "member_id"
    t.integer "course_id"
  end

  create_table "deactivations", force: true do |t|
    t.text     "comment"
    t.integer  "config_deactivation_reason_id"
    t.integer  "disabled_item_id"
    t.string   "disabled_item_type"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0
    t.integer  "attempts",   default: 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "district_course_stats", force: true do |t|
    t.integer  "total",              default: 0
    t.integer  "district_report_id"
    t.integer  "course_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "district_course_stats", ["district_report_id"], name: "index_district_course_stats_on_district_report_id", using: :btree

  create_table "district_report_areas", force: true do |t|
    t.integer  "district_report_id"
    t.integer  "area_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "district_report_areas", ["area_id"], name: "index_district_report_areas_on_area_id", using: :btree
  add_index "district_report_areas", ["district_report_id"], name: "index_district_report_areas_on_district_report_id", using: :btree

  create_table "district_reports", force: true do |t|
    t.date     "month_year"
    t.decimal  "total_offering",                  precision: 10, scale: 2, default: 0.0
    t.integer  "total_cells",                                              default: 0
    t.integer  "total_supervisions",                                       default: 0
    t.integer  "total_coordinations",                                      default: 0
    t.integer  "total_areas",                                              default: 0
    t.integer  "total_collaborators",                                      default: 0
    t.integer  "total_attendees",                                          default: 0
    t.integer  "total_visitors",                                           default: 0
    t.integer  "total_children",                                           default: 0
    t.integer  "total_inareas",                                            default: 0
    t.integer  "integer",                                                  default: 0
    t.integer  "total_outareas",                                           default: 0
    t.integer  "total_incoordinations",                                    default: 0
    t.integer  "total_outcoordinations",                                   default: 0
    t.integer  "total_insupervisions",                                     default: 0
    t.integer  "total_outsupervisions",                                    default: 0
    t.integer  "total_incells",                                            default: 0
    t.integer  "total_outcells",                                           default: 0
    t.integer  "total_leader_late_reports",                                default: 0
    t.integer  "total_supervisor_late_reports",                            default: 0
    t.integer  "total_coordinator_late_reports",                           default: 0
    t.integer  "total_area_pastor_late_reports",                           default: 0
    t.integer  "total_no_age",                                             default: 0
    t.integer  "total_age_group1",                                         default: 0
    t.integer  "total_age_group2",                                         default: 0
    t.integer  "total_age_group3",                                         default: 0
    t.integer  "total_age_group4",                                         default: 0
    t.integer  "total_age_group5",                                         default: 0
    t.integer  "total_age_group6",                                         default: 0
    t.integer  "total_age_group7",                                         default: 0
    t.integer  "total_age_group8",                                         default: 0
    t.integer  "total_age_group9",                                         default: 0
    t.integer  "total_age_group10",                                        default: 0
    t.integer  "total_single",                                             default: 0
    t.integer  "total_married",                                            default: 0
    t.integer  "total_divorced",                                           default: 0
    t.integer  "total_separated",                                          default: 0
    t.integer  "total_concubinage",                                        default: 0
    t.integer  "total_widow",                                              default: 0
    t.integer  "total_civilunion",                                         default: 0
    t.integer  "district_id"
    t.datetime "created_at",                                                             null: false
    t.datetime "updated_at",                                                             null: false
    t.integer  "church_type"
    t.integer  "total_male",                                               default: 0
    t.integer  "total_female",                                             default: 0
    t.integer  "total_leadership_visits",                                  default: 0
    t.integer  "total_delivered_reports",                                  default: 0
    t.integer  "total_leader_late_delivery",                               default: 0
    t.integer  "total_supervisor_late_delivery",                           default: 0
    t.integer  "total_coordinator_late_delivery",                          default: 0
    t.integer  "total_area_pastor_late_delivery",                          default: 0
  end

  add_index "district_reports", ["district_id"], name: "index_district_reports_on_district_id", using: :btree

  create_table "district_role_stats", force: true do |t|
    t.integer  "total",              default: 0
    t.integer  "district_report_id"
    t.integer  "role_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "district_role_stats", ["district_report_id"], name: "index_district_role_stats_on_district_report_id", using: :btree

  create_table "districts", force: true do |t|
    t.string   "name",                        limit: 30
    t.boolean  "active",                                 default: true
    t.integer  "site_id"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.date     "monthly_bday_sent_at"
    t.date     "statistics_generated_at"
    t.date     "statistics_sent_at"
    t.date     "generated_pending_report_at"
    t.date     "sent_pending_report_at"
  end

  create_table "documents", force: true do |t|
    t.string   "toi"
    t.date     "date_signed"
    t.date     "date_recorded"
    t.string   "party1"
    t.string   "party2"
    t.string   "cfn"
    t.string   "county"
    t.integer  "amount"
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "record_file_name"
    t.string   "record_content_type"
    t.integer  "record_file_size"
    t.datetime "record_updated_at"
  end

  add_index "documents", ["property_id", "cfn"], name: "index_documents_on_property_id_and_cfn", using: :btree

  create_table "enrollment_installments", force: true do |t|
    t.boolean  "paid",          default: false
    t.text     "comment"
    t.integer  "money_type"
    t.datetime "pay_date"
    t.integer  "receiver_id"
    t.integer  "enrollment_id"
    t.integer  "parcel_id"
    t.string   "parcel_type"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "enrollments", force: true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "user_type"
    t.integer  "payment_plan_id"
    t.integer  "payment_term_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "enrollments", ["event_id"], name: "index_enrollments_on_event_id", using: :btree
  add_index "enrollments", ["user_id"], name: "index_enrollments_on_user_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "site",              default: "http://www"
    t.text     "description"
    t.text     "observation"
    t.date     "initial_date"
    t.date     "final_date"
    t.boolean  "enrolling",         default: false
    t.boolean  "public",            default: false
    t.integer  "vacancy"
    t.boolean  "paid",              default: true
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "marital_status"
    t.integer  "min_age"
    t.integer  "max_age"
    t.integer  "gender",            default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "guests", force: true do |t|
    t.string   "name"
    t.string   "badge_name",         limit: 20
    t.date     "date_of_birth"
    t.date     "new_born_date"
    t.integer  "gender",                        default: 1
    t.string   "email"
    t.string   "phone"
    t.string   "cell_phone"
    t.integer  "marital_status",                default: 1
    t.string   "consort"
    t.date     "date_of_visit"
    t.string   "host"
    t.boolean  "goes_to_church"
    t.string   "what_church"
    t.string   "more_info_outros"
    t.boolean  "wants_a_visit"
    t.string   "pray_for_me"
    t.string   "cpf"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "address_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "cell_provider"
    t.integer  "importing_id"
    t.boolean  "active",                        default: true
    t.string   "origin"
  end

  create_table "guests_letters", id: false, force: true do |t|
    t.integer  "guest_id"
    t.integer  "letter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "installments", force: true do |t|
    t.integer  "parcel_number"
    t.decimal  "value",           precision: 8, scale: 2, default: 0.0
    t.date     "due_start"
    t.date     "due_end"
    t.string   "comment"
    t.integer  "payment_term_id"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  create_table "leaders", force: true do |t|
    t.integer  "member_id"
    t.integer  "cell_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leaders_supervisors", id: false, force: true do |t|
    t.integer  "leader_id"
    t.integer  "supervisor_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "lessons", force: true do |t|
    t.datetime "date"
    t.integer  "classroom_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "letter_images", force: true do |t|
    t.string   "name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "letter_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "letter_images", ["letter_id"], name: "index_letter_images_on_letter_id", using: :btree

  create_table "letters", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "page_break", default: true
    t.boolean  "public",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "letters_members", id: false, force: true do |t|
    t.integer  "letter_id"
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "member_searches", force: true do |t|
    t.string   "name"
    t.string   "role"
    t.date     "date_of_birth_initial"
    t.date     "date_of_birth_final"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "member_sessions", force: true do |t|
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: true do |t|
    t.string   "name"
    t.string   "badge_name",                limit: 20
    t.integer  "gender",                               default: 1
    t.date     "date_of_birth"
    t.date     "new_born_date"
    t.date     "accepted_date"
    t.date     "baptism_date"
    t.date     "marriage_date"
    t.string   "phone"
    t.string   "cell_phone"
    t.string   "com_phone"
    t.string   "com_phone_ext"
    t.string   "occupation"
    t.integer  "marital_status"
    t.string   "consort"
    t.string   "father"
    t.string   "mother"
    t.string   "cpf"
    t.string   "rg"
    t.boolean  "change_password",                      default: true
    t.string   "username",                  limit: 32
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "email"
    t.integer  "current_role"
    t.integer  "current_member_role"
    t.text     "current_zone_restrictions"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "active",                               default: true
    t.datetime "last_request_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.integer  "failed_login_count"
    t.boolean  "is_leader",                            default: false
    t.integer  "address_id"
    t.integer  "cell_id"
    t.integer  "born_city_id"
    t.integer  "born_state_id"
    t.integer  "born_country_id"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "cell_provider"
    t.integer  "importing_id"
    t.datetime "current_login_at"
    t.string   "last_login_at"
    t.integer  "login_count"
    t.date     "sent_bday_at"
    t.date     "sent_bday_tip_at"
  end

  create_table "members_roles", force: true do |t|
    t.integer "member_id"
    t.integer "role_id"
    t.integer "cell_id"
  end

  create_table "more_infos", force: true do |t|
    t.boolean  "wants"
    t.integer  "guest_id"
    t.integer  "config_more_info_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "open_installments", force: true do |t|
    t.integer  "parcel_number"
    t.decimal  "value",         precision: 10, scale: 2, default: 0.0
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  create_table "payment_plans", force: true do |t|
    t.text     "description"
    t.text     "observation"
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "payment_terms", force: true do |t|
    t.integer  "installment_type",                         default: 1
    t.decimal  "value",            precision: 8, scale: 2, default: 0.0
    t.text     "observation"
    t.integer  "payment_plan_id"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  create_table "pending_report_emails", force: true do |t|
    t.integer  "cell_structure_id"
    t.string   "cell_structure_type"
    t.text     "body",                limit: 16777215
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "pending_report_emails", ["cell_structure_type", "cell_structure_id"], name: "index_pending_report_emails", using: :btree

  create_table "presbyters", force: true do |t|
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: true do |t|
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.text     "legal_desc"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "properties", ["user_id", "updated_at"], name: "index_properties_on_user_id_and_updated_at", using: :btree

  create_table "refinery_images", force: true do |t|
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_uid"
    t.string   "image_ext"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "refinery_page_part_translations", force: true do |t|
    t.integer  "refinery_page_part_id", null: false
    t.string   "locale",                null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.text     "body"
  end

  add_index "refinery_page_part_translations", ["locale"], name: "index_refinery_page_part_translations_on_locale", using: :btree
  add_index "refinery_page_part_translations", ["refinery_page_part_id"], name: "index_refinery_page_part_translations_on_refinery_page_part_id", using: :btree

  create_table "refinery_page_parts", force: true do |t|
    t.integer  "refinery_page_id"
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "refinery_page_parts", ["id"], name: "index_refinery_page_parts_on_id", using: :btree
  add_index "refinery_page_parts", ["refinery_page_id"], name: "index_refinery_page_parts_on_refinery_page_id", using: :btree

  create_table "refinery_page_translations", force: true do |t|
    t.integer  "refinery_page_id", null: false
    t.string   "locale",           null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "title"
    t.string   "custom_slug"
    t.string   "menu_title"
    t.string   "slug"
  end

  add_index "refinery_page_translations", ["locale"], name: "index_refinery_page_translations_on_locale", using: :btree
  add_index "refinery_page_translations", ["refinery_page_id"], name: "index_refinery_page_translations_on_refinery_page_id", using: :btree

  create_table "refinery_pages", force: true do |t|
    t.integer  "parent_id"
    t.string   "path"
    t.string   "slug"
    t.boolean  "show_in_menu",        default: true
    t.string   "link_url"
    t.string   "menu_match"
    t.boolean  "deletable",           default: true
    t.boolean  "draft",               default: false
    t.boolean  "skip_to_first_child", default: false
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "view_template"
    t.string   "layout_template"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "refinery_pages", ["depth"], name: "index_refinery_pages_on_depth", using: :btree
  add_index "refinery_pages", ["id"], name: "index_refinery_pages_on_id", using: :btree
  add_index "refinery_pages", ["lft"], name: "index_refinery_pages_on_lft", using: :btree
  add_index "refinery_pages", ["parent_id"], name: "index_refinery_pages_on_parent_id", using: :btree
  add_index "refinery_pages", ["rgt"], name: "index_refinery_pages_on_rgt", using: :btree

  create_table "refinery_resources", force: true do |t|
    t.string   "file_mime_type"
    t.string   "file_name"
    t.integer  "file_size"
    t.string   "file_uid"
    t.string   "file_ext"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "refinery_roles", force: true do |t|
    t.string "title"
  end

  create_table "refinery_roles_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "refinery_roles_users", ["role_id", "user_id"], name: "index_refinery_roles_users_on_role_id_and_user_id", using: :btree
  add_index "refinery_roles_users", ["user_id", "role_id"], name: "index_refinery_roles_users_on_user_id_and_role_id", using: :btree

  create_table "refinery_user_plugins", force: true do |t|
    t.integer "user_id"
    t.string  "name"
    t.integer "position"
  end

  add_index "refinery_user_plugins", ["name"], name: "index_refinery_user_plugins_on_name", using: :btree
  add_index "refinery_user_plugins", ["user_id", "name"], name: "index_refinery_user_plugins_on_user_id_and_name", unique: true, using: :btree

  create_table "refinery_users", force: true do |t|
    t.string   "username",               null: false
    t.string   "email",                  null: false
    t.string   "encrypted_password",     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "sign_in_count"
    t.datetime "remember_created_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "refinery_users", ["id"], name: "index_refinery_users_on_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "title"
    t.string   "icon_image_name"
    t.boolean  "active",            default: true
    t.integer  "subordinate_id"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "seo_meta", force: true do |t|
    t.integer  "seo_meta_id"
    t.string   "seo_meta_type"
    t.string   "browser_title"
    t.string   "meta_keywords"
    t.text     "meta_description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "seo_meta", ["id"], name: "index_seo_meta_on_id", using: :btree
  add_index "seo_meta", ["seo_meta_id", "seo_meta_type"], name: "index_seo_meta_on_seo_meta_id_and_seo_meta_type", using: :btree

  create_table "site_images", force: true do |t|
    t.string   "name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "site_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "site_images", ["site_id"], name: "index_site_images_on_site_id", using: :btree

  create_table "sites", force: true do |t|
    t.text     "content"
    t.integer  "cell_structure_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "cell_structure_type"
  end

  create_table "states", force: true do |t|
    t.string   "code",       limit: 2
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "supervision_course_stats", force: true do |t|
    t.integer  "total",                 default: 0
    t.integer  "supervision_report_id"
    t.integer  "course_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "supervision_course_stats", ["supervision_report_id"], name: "index_supervision_course_stats_on_supervision_report_id", using: :btree

  create_table "supervision_report_cells", force: true do |t|
    t.integer  "supervision_report_id"
    t.integer  "cell_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "supervision_report_cells", ["cell_id"], name: "index_supervision_report_cells_on_cell_id", using: :btree
  add_index "supervision_report_cells", ["supervision_report_id"], name: "index_supervision_report_cells_on_supervision_report_id", using: :btree

  create_table "supervision_reports", force: true do |t|
    t.date     "month_year"
    t.decimal  "total_offering",                  precision: 10, scale: 2, default: 0.0
    t.integer  "total_attendees",                                          default: 0
    t.integer  "total_visitors",                                           default: 0
    t.integer  "total_children",                                           default: 0
    t.integer  "total_collaborators",                                      default: 0
    t.integer  "total_cells",                                              default: 0
    t.integer  "supervision_id"
    t.datetime "created_at",                                                             null: false
    t.datetime "updated_at",                                                             null: false
    t.integer  "total_incells",                                            default: 0
    t.integer  "total_outcells",                                           default: 0
    t.integer  "total_leader_late_reports",                                default: 0
    t.integer  "total_no_age",                                             default: 0
    t.integer  "total_age_group1",                                         default: 0
    t.integer  "total_age_group2",                                         default: 0
    t.integer  "total_age_group3",                                         default: 0
    t.integer  "total_age_group4",                                         default: 0
    t.integer  "total_age_group5",                                         default: 0
    t.integer  "total_age_group6",                                         default: 0
    t.integer  "total_age_group7",                                         default: 0
    t.integer  "total_age_group8",                                         default: 0
    t.integer  "total_age_group9",                                         default: 0
    t.integer  "total_age_group10",                                        default: 0
    t.integer  "total_single",                                             default: 0
    t.integer  "total_married",                                            default: 0
    t.integer  "total_divorced",                                           default: 0
    t.integer  "total_separated",                                          default: 0
    t.integer  "total_concubinage",                                        default: 0
    t.integer  "total_widow",                                              default: 0
    t.integer  "total_civilunion",                                         default: 0
    t.integer  "total_supervisor_late_reports",                            default: 0
    t.integer  "church_type"
    t.integer  "total_male",                                               default: 0
    t.integer  "total_female",                                             default: 0
    t.integer  "total_leadership_visits",                                  default: 0
    t.integer  "total_delivered_reports",                                  default: 0
    t.integer  "total_coordinator_late_reports",                           default: 0
    t.integer  "total_area_pastor_late_reports",                           default: 0
    t.integer  "total_leader_late_delivery",                               default: 0
    t.integer  "total_supervisor_late_delivery",                           default: 0
    t.integer  "total_coordinator_late_delivery",                          default: 0
    t.integer  "total_area_pastor_late_delivery",                          default: 0
  end

  add_index "supervision_reports", ["supervision_id"], name: "index_supervision_reports_on_supervision_id", using: :btree

  create_table "supervision_role_stats", force: true do |t|
    t.integer  "total",                 default: 0
    t.integer  "supervision_report_id"
    t.integer  "role_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "supervision_role_stats", ["supervision_report_id"], name: "index_supervision_role_stats_on_supervision_report_id", using: :btree

  create_table "supervisions", force: true do |t|
    t.string   "name",                        limit: 30
    t.boolean  "active",                                 default: true
    t.integer  "report_id"
    t.integer  "coordination_id"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.boolean  "generate_stats",                         default: true
    t.date     "monthly_bday_sent_at"
    t.date     "statistics_generated_at"
    t.date     "statistics_sent_at"
    t.date     "generated_pending_report_at"
    t.date     "sent_pending_report_at"
  end

  add_index "supervisions", ["coordination_id"], name: "index_supervisions_on_coordination_id", using: :btree

  create_table "supervisions_supervisors", id: false, force: true do |t|
    t.integer "supervision_id"
    t.integer "supervisor_id"
  end

  add_index "supervisions_supervisors", ["supervision_id", "supervisor_id"], name: "sup_sup", unique: true, using: :btree

  create_table "supervisors", force: true do |t|
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "swaps", force: true do |t|
    t.boolean  "select_all"
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "swapselections", force: true do |t|
    t.integer  "swap_id"
    t.integer  "selected_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "task_histories", force: true do |t|
    t.integer  "status"
    t.text     "comment"
    t.integer  "task_id"
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: true do |t|
    t.string   "short_description", limit: 50
    t.text     "description"
    t.integer  "status"
    t.integer  "kind"
    t.integer  "severity"
    t.integer  "target_type",                  default: 0
    t.integer  "creator_id"
    t.integer  "responsible_id"
    t.integer  "member_id"
    t.integer  "guest_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "themes", force: true do |t|
    t.string   "author",             limit: 30
    t.date     "date"
    t.string   "title",              limit: 50
    t.text     "description"
    t.string   "study_file_name"
    t.string   "study_content_type"
    t.integer  "study_file_size"
    t.datetime "study_updated_at"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "user_identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versicles", force: true do |t|
    t.string   "book"
    t.integer  "chapter"
    t.integer  "initialVersicle"
    t.integer  "finalVersicle"
    t.string   "text"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
