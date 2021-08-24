BEGIN TRANSACTION;
DROP TABLE IF EXISTS "django_migrations";
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "auth_group_permissions";
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "auth_user_groups";
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "auth_user_user_permissions";
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "django_admin_log";
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "django_content_type";
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "auth_permission";
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "auth_group";
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "auth_user";
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "django_session";
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
DROP TABLE IF EXISTS "core_eps";
CREATE TABLE IF NOT EXISTS "core_eps" (
	"id"	integer NOT NULL,
	"NEPS"	varchar(200),
	"NRQPS"	varchar(200),
	"processo"	varchar(200),
	"posicao_soldagem"	varchar(200),
	"especificacao"	varchar(200),
	"PN"	integer NOT NULL,
	"faixa_esp"	varchar(200),
	"faixa_diam"	varchar(200),
	"especificacao_metal_ad"	varchar(200),
	"classificacao"	varchar(200),
	"FN"	integer NOT NULL,
	"progressao_soldagem"	varchar(200),
	"qrcode"	varchar(100),
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "admin_interface_theme";
CREATE TABLE IF NOT EXISTS "admin_interface_theme" (
	"id"	integer NOT NULL,
	"name"	varchar(50) NOT NULL UNIQUE,
	"active"	bool NOT NULL,
	"title"	varchar(50) NOT NULL,
	"title_visible"	bool NOT NULL,
	"logo_visible"	bool NOT NULL,
	"css_header_background_color"	varchar(10) NOT NULL,
	"css_header_text_color"	varchar(10) NOT NULL,
	"css_header_link_color"	varchar(10) NOT NULL,
	"css_header_link_hover_color"	varchar(10) NOT NULL,
	"css_module_background_color"	varchar(10) NOT NULL,
	"css_module_text_color"	varchar(10) NOT NULL,
	"css_module_link_color"	varchar(10) NOT NULL,
	"css_module_link_hover_color"	varchar(10) NOT NULL,
	"css_module_rounded_corners"	bool NOT NULL,
	"css_generic_link_color"	varchar(10) NOT NULL,
	"css_generic_link_hover_color"	varchar(10) NOT NULL,
	"css_save_button_background_color"	varchar(10) NOT NULL,
	"css_save_button_background_hover_color"	varchar(10) NOT NULL,
	"css_save_button_text_color"	varchar(10) NOT NULL,
	"css_delete_button_background_color"	varchar(10) NOT NULL,
	"css_delete_button_background_hover_color"	varchar(10) NOT NULL,
	"css_delete_button_text_color"	varchar(10) NOT NULL,
	"css"	text NOT NULL,
	"list_filter_dropdown"	bool NOT NULL,
	"related_modal_active"	bool NOT NULL,
	"related_modal_background_color"	varchar(10) NOT NULL,
	"related_modal_rounded_corners"	bool NOT NULL,
	"logo_color"	varchar(10) NOT NULL,
	"title_color"	varchar(10) NOT NULL,
	"recent_actions_visible"	bool NOT NULL,
	"favicon"	varchar(100) NOT NULL,
	"related_modal_background_opacity"	varchar(5) NOT NULL,
	"env_name"	varchar(50) NOT NULL,
	"env_color"	varchar(10) NOT NULL,
	"env_visible_in_header"	bool NOT NULL,
	"env_visible_in_favicon"	bool NOT NULL,
	"related_modal_close_button_visible"	bool NOT NULL,
	"language_chooser_active"	bool NOT NULL,
	"language_chooser_display"	varchar(10) NOT NULL,
	"list_filter_sticky"	bool NOT NULL,
	"form_pagination_sticky"	bool NOT NULL,
	"form_submit_sticky"	bool NOT NULL,
	"css_module_background_selected_color"	varchar(10) NOT NULL,
	"css_module_link_selected_color"	varchar(10) NOT NULL,
	"logo"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "core_soldadores";
CREATE TABLE IF NOT EXISTS "core_soldadores" (
	"id"	integer NOT NULL,
	"sinete"	varchar(200),
	"nome"	varchar(200),
	"EPS"	varchar(200),
	"processo"	varchar(200),
	"modo_trensferencia"	varchar(200),
	"FN"	integer NOT NULL,
	"metal_base"	varchar(200),
	"esp_chanfro"	varchar(200),
	"esp_angulo"	varchar(200),
	"diametro_chanfro"	varchar(200),
	"diametro_angulo"	varchar(200),
	"posiçao"	varchar(200),
	"progressao_soldagem"	varchar(200),
	"cobre_junta"	varchar(200),
	"notas"	varchar(200),
	"qrcode"	varchar(100),
	"validade"	date,
	"dados"	varchar(200) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (1,'contenttypes','0001_initial','2021-06-06 17:16:47.179274');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (2,'auth','0001_initial','2021-06-06 17:16:47.247495');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (3,'admin','0001_initial','2021-06-06 17:16:47.282495');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (4,'admin','0002_logentry_remove_auto_add','2021-06-06 17:16:47.366504');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (5,'admin','0003_logentry_add_action_flag_choices','2021-06-06 17:16:47.387498');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (6,'contenttypes','0002_remove_content_type_name','2021-06-06 17:16:47.437505');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (7,'auth','0002_alter_permission_name_max_length','2021-06-06 17:16:47.497493');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (8,'auth','0003_alter_user_email_max_length','2021-06-06 17:16:47.570494');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (9,'auth','0004_alter_user_username_opts','2021-06-06 17:16:47.613494');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (10,'auth','0005_alter_user_last_login_null','2021-06-06 17:16:47.668496');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (11,'auth','0006_require_contenttypes_0002','2021-06-06 17:16:47.690498');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (12,'auth','0007_alter_validators_add_error_messages','2021-06-06 17:16:47.751500');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (13,'auth','0008_alter_user_username_max_length','2021-06-06 17:16:47.787498');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (14,'auth','0009_alter_user_last_name_max_length','2021-06-06 17:16:47.873499');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (15,'auth','0010_alter_group_name_max_length','2021-06-06 17:16:47.959499');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (16,'auth','0011_update_proxy_permissions','2021-06-06 17:16:48.039495');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (17,'auth','0012_alter_user_first_name_max_length','2021-06-06 17:16:48.102496');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (18,'sessions','0001_initial','2021-06-06 17:16:48.119499');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (19,'core','0001_initial','2021-06-16 09:41:40.773327');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (20,'core','0002_auto_20210616_0711','2021-06-16 10:11:22.406845');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (21,'core','0003_soldadores','2021-06-16 12:17:43.375737');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (22,'core','0004_auto_20210616_1255','2021-06-16 15:55:57.079309');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (23,'core','0005_soldadores_dados','2021-08-17 21:43:06.748034');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (24,'admin_interface','0001_initial','2021-08-22 22:45:23.557359');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (25,'admin_interface','0002_add_related_modal','2021-08-22 22:45:23.658354');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (26,'admin_interface','0003_add_logo_color','2021-08-22 22:45:23.686354');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (27,'admin_interface','0004_rename_title_color','2021-08-22 22:45:23.738354');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (28,'admin_interface','0005_add_recent_actions_visible','2021-08-22 22:45:23.778355');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (29,'admin_interface','0006_bytes_to_str','2021-08-22 22:45:24.069350');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (30,'admin_interface','0007_add_favicon','2021-08-22 22:45:24.089351');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (31,'admin_interface','0008_change_related_modal_background_opacity_type','2021-08-22 22:45:24.156363');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (32,'admin_interface','0009_add_enviroment','2021-08-22 22:45:24.201351');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (33,'admin_interface','0010_add_localization','2021-08-22 22:45:24.303349');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (34,'admin_interface','0011_add_environment_options','2021-08-22 22:45:24.368353');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (35,'admin_interface','0012_update_verbose_names','2021-08-22 22:45:24.397349');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (36,'admin_interface','0013_add_related_modal_close_button','2021-08-22 22:45:24.426357');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (37,'admin_interface','0014_name_unique','2021-08-22 22:45:24.467352');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (38,'admin_interface','0015_add_language_chooser_active','2021-08-22 22:45:24.538353');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (39,'admin_interface','0016_add_language_chooser_display','2021-08-22 22:45:24.573355');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (40,'admin_interface','0017_change_list_filter_dropdown','2021-08-22 22:45:24.643355');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (41,'admin_interface','0018_theme_list_filter_sticky','2021-08-22 22:45:24.706350');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (42,'admin_interface','0019_add_form_sticky','2021-08-22 22:45:24.806354');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (43,'admin_interface','0020_module_selected_colors','2021-08-22 22:45:24.887352');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (44,'admin_interface','0021_file_extension_validator','2021-08-22 22:45:24.936350');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (45,'core','0006_auto_20210822_1945','2021-08-22 22:45:24.990355');
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (1,'2021-06-16 09:58:28.164549','1','VCE-TG-AC -02','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (2,'2021-06-16 10:37:29.444304','1','VCE-TG-AC -02','[]',7,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (3,'2021-06-16 10:40:00.427445','2','VCE-TG-AI-02','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (4,'2021-06-16 12:25:39.601017','1','José Gomes Pereira','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (5,'2021-06-16 15:56:37.974067','2','VCE-TG-AI-02','[{"changed": {"fields": ["Qrcode"]}}]',7,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (6,'2021-06-16 16:06:51.686676','2','VCE-TG-AI-02','[]',7,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (7,'2021-06-16 16:08:34.476974','2','S-01','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (8,'2021-06-16 16:43:08.961846','3','S-03','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (9,'2021-06-16 16:54:32.696538','4','S-03','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (10,'2021-06-16 16:57:24.905814','5','S-04','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (11,'2021-06-16 16:59:32.552943','6','S-06','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (12,'2021-06-16 17:02:19.848815','7','S-06','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (13,'2021-06-16 17:03:37.880042','8','S-07','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (14,'2021-06-16 17:05:06.057100','9','S-11','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (15,'2021-06-16 17:29:58.494100','3','VCE-ER-AC -02','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (16,'2021-06-16 17:31:41.990400','4','VCE-TG-AI-03-VP','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (17,'2021-06-16 18:21:28.298210','5','VCE-TG-AI-04-TA','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (18,'2021-06-16 19:10:05.153253','6','VCE-TG-AC-05-VP','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (19,'2021-06-16 19:11:14.407423','7','VCE-TG-AC-06-TA','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (20,'2021-06-16 19:12:39.630989','8','VCE-TG-AI-07-VP','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (21,'2021-06-16 19:13:49.081607','9','VCE-TG-AI-08-TA','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (22,'2021-06-16 19:15:07.991147','10','VCE-TG-AC-09-VP','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (23,'2021-06-16 19:15:57.540130','11','VCE-TG-AC-10-TA','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (24,'2021-06-16 19:17:01.406908','12','VCE-TG-625','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (25,'2021-08-02 15:10:26.313354','12','VCE-TG-625','[{"changed": {"fields": ["Qrcode"]}}]',7,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (26,'2021-08-12 12:39:17.475280','13','teste','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (27,'2021-08-12 12:41:02.738227','13','teste','',7,1,3);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (28,'2021-08-12 12:48:26.450541','14','teste','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (29,'2021-08-12 12:49:29.594483','14','teste','',7,1,3);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (30,'2021-08-12 16:19:47.428857','8','VCE-TG-AI-07-VP','[{"changed": {"fields": ["Qrcode"]}}]',7,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (31,'2021-08-12 16:25:49.655646','1','VCE-TG-AC -02','[{"changed": {"fields": ["Qrcode"]}}]',7,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (32,'2021-08-17 21:44:31.225957','9','S-11','[{"changed": {"fields": ["Dados"]}}]',8,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (33,'2021-08-17 21:48:51.905328','9','S-11','[]',8,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (34,'2021-08-17 22:20:15.957525','9','S-11','[]',8,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (35,'2021-08-18 22:23:49.589405','1','S-01','[{"changed": {"fields": ["Qrcode", "Dados"]}}]',8,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (36,'2021-08-18 23:19:29.959151','4','S-03','[{"changed": {"fields": ["Qrcode", "Dados"]}}]',8,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (37,'2021-08-18 23:25:01.465138','4','S-03','[]',8,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (38,'2021-08-18 23:25:13.264254','5','S-04','[{"changed": {"fields": ["Qrcode", "Dados"]}}]',8,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (39,'2021-08-18 23:30:34.430035','7','S-06','[{"changed": {"fields": ["Qrcode", "Dados"]}}]',8,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (40,'2021-08-18 23:37:15.973641','8','S-07','[{"changed": {"fields": ["Qrcode", "Dados"]}}]',8,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (41,'2021-08-18 23:44:10.765323','9','S-11','[{"changed": {"fields": ["Qrcode", "Dados"]}}]',8,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (42,'2021-08-19 09:44:57.933045','2','S-01','[{"changed": {"fields": ["Dados"]}}]',8,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (43,'2021-08-19 09:47:23.853425','1','S-01','[{"changed": {"fields": ["Qrcode"]}}]',8,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (44,'2021-08-19 09:48:46.564424','1','S-01','[{"changed": {"fields": ["Qrcode"]}}]',8,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (45,'2021-08-19 09:57:55.814377','5','S-04','[{"changed": {"fields": ["Dados"]}}]',8,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (46,'2021-08-19 09:58:47.454374','7','S-06','[{"changed": {"fields": ["Dados"]}}]',8,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (47,'2021-08-19 09:58:56.439374','6','S-06','[{"changed": {"fields": ["Dados"]}}]',8,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (48,'2021-08-19 10:00:58.124977','8','S-07','[{"changed": {"fields": ["Dados"]}}]',8,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (49,'2021-08-22 22:47:11.223347','1','Django','[{"changed": {"fields": ["Background color", "Text color", "Background color", "Link color", "Link hover color"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (50,'2021-08-22 22:47:52.598712','1','Django','[{"changed": {"fields": ["Color", "Background color", "Background hover color"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (51,'2021-08-22 22:48:06.181741','1','Django','[{"changed": {"fields": ["Color"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (52,'2021-08-22 22:48:27.595728','1','Django','[{"changed": {"fields": ["Logo"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (53,'2021-08-22 22:48:52.980172','1','Django','[{"changed": {"fields": ["Logo"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (54,'2021-08-22 22:49:59.709814','1','Django','[{"changed": {"fields": ["Favicon"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (55,'2021-08-22 22:53:01.309144','1','Django','[{"changed": {"fields": ["Logo"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (56,'2021-08-22 22:54:03.005755','1','Django','[{"changed": {"fields": ["Favicon"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (57,'2021-08-22 22:54:48.960288','1','Django','[{"changed": {"fields": ["Visible"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (58,'2021-08-22 22:54:58.342692','1','Django','[{"changed": {"fields": ["Visible"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (59,'2021-08-22 22:55:24.014874','1','Django','[{"changed": {"fields": ["Visible", "Title"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (60,'2021-08-22 22:59:16.436244','1','Django','[{"changed": {"fields": ["Logo", "Visible"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (61,'2021-08-22 22:59:58.588360','1','Django','[{"changed": {"fields": ["Logo"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (62,'2021-08-22 23:00:19.284494','1','Django','[{"changed": {"fields": ["Logo"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (63,'2021-08-22 23:01:31.980397','1','Django','[{"changed": {"fields": ["Logo"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (64,'2021-08-22 23:03:25.431532','1','Django','',9,1,3);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (65,'2021-08-22 23:03:39.862756','2','Django','[{"changed": {"fields": ["Logo"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (66,'2021-08-22 23:04:12.784224','2','Django','[{"changed": {"fields": ["Title"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (67,'2021-08-22 23:11:10.049961','2','Django','[{"changed": {"fields": ["Visible"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (68,'2021-08-22 23:15:30.368694','2','Django','[{"changed": {"fields": ["Color", "Background color", "Text color", "Background color", "Link hover color", "Link color", "Link hover color", "Background color", "Background hover color"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (69,'2021-08-22 23:15:52.637863','2','Django','[{"changed": {"fields": ["Color"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (70,'2021-08-22 23:21:47.408021','2','Django','[{"changed": {"fields": ["Logo", "Visible"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (71,'2021-08-22 23:22:55.000627','2','Django','[{"changed": {"fields": ["Visible"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (72,'2021-08-22 23:23:46.487527','2','Django','[{"changed": {"fields": ["Color"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (73,'2021-08-22 23:24:07.862587','2','Django','[{"changed": {"fields": ["Background color", "Link color", "Background color"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (74,'2021-08-22 23:24:22.381166','2','Django','[{"changed": {"fields": ["Background color"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (75,'2021-08-22 23:24:51.935867','2','Django','[{"changed": {"fields": ["Color", "Text color", "Link hover color", "Link hover color", "Background hover color"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (76,'2021-08-22 23:27:39.829389','2','Django','[{"changed": {"fields": ["Logo", "Visible"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (77,'2021-08-22 23:28:02.707448','2','Django','[{"changed": {"fields": ["Logo"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (78,'2021-08-22 23:41:45.269618','2','Django','[{"changed": {"fields": ["Logo"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (79,'2021-08-22 23:42:47.698797','2','Django','[{"changed": {"fields": ["Logo"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (80,'2021-08-22 23:44:23.510880','2','Django','[{"changed": {"fields": ["Logo"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (81,'2021-08-22 23:52:46.051055','2','Django','[{"changed": {"fields": ["Logo"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (82,'2021-08-22 23:58:54.340052','2','Django','[]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (83,'2021-08-23 00:00:38.858958','2','Django','[{"changed": {"fields": ["Logo"]}}]',9,1,2);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (84,'2021-08-23 00:03:44.167360','2','Django','[{"changed": {"fields": ["Color", "Background color", "Background color", "Link color", "Background color"]}}]',9,1,2);
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (2,'auth','permission');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (3,'auth','group');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (4,'auth','user');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (6,'sessions','session');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (7,'core','eps');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (8,'core','soldadores');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (9,'admin_interface','theme');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (25,7,'add_eps','Can add eps');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (26,7,'change_eps','Can change eps');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (27,7,'delete_eps','Can delete eps');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (28,7,'view_eps','Can view eps');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (29,8,'add_soldadores','Can add soldadores');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (30,8,'change_soldadores','Can change soldadores');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (31,8,'delete_soldadores','Can delete soldadores');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (32,8,'view_soldadores','Can view soldadores');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (33,9,'add_theme','Can add Theme');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (34,9,'change_theme','Can change Theme');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (35,9,'delete_theme','Can delete Theme');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (36,9,'view_theme','Can view Theme');
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","username","last_name","email","is_staff","is_active","date_joined","first_name") VALUES (1,'pbkdf2_sha256$216000$LEYOvrHaDddL$XQGE/bHikvLxKvI7Kv07Ke8aGrX5nL+xCZunoVbzpto=','2021-08-23 00:04:17.165983',1,'sandrobispo','','',1,1,'2021-06-06 17:17:30.904389','');
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('s2a8jgoomfglum6zhr0symafezcc4p1s','.eJxVjEsOwjAMBe-SNYqcxK1dlux7hsqJAymgRupnhbg7VOoCtm9m3ssMsq1l2JY8D6Oas3Hm9LtFSY887UDvMt2qTXVa5zHaXbEHXWxfNT8vh_t3UGQp31rAN0EbVGZo8QqaGmKfMgPFqJ1rBYRjRx0SKHBofWBEEZczIHky7w_HdTbg:1lpwPW:mjFtmJReJlu1qYt_HjsIe5RKLbSBz0eHoZiU8v0uavY','2021-06-20 17:18:06.441137');
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('d9k89j84ir55hip879040r7rux07ocm5','.eJxVjEsOwjAMBe-SNYqcxK1dlux7hsqJAymgRupnhbg7VOoCtm9m3ssMsq1l2JY8D6Oas3Hm9LtFSY887UDvMt2qTXVa5zHaXbEHXWxfNT8vh_t3UGQp31rAN0EbVGZo8QqaGmKfMgPFqJ1rBYRjRx0SKHBofWBEEZczIHky7w_HdTbg:1mAZZo:5ECy75DcoG5kpiD63gnOhRe2BmUqFGaOxM4bBIz6t3c','2021-08-16 15:10:00.207428');
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('k682dh9a422ln6ieus644vyxn61j8t85','.eJxVjEsOwjAMBe-SNYqcxK1dlux7hsqJAymgRupnhbg7VOoCtm9m3ssMsq1l2JY8D6Oas3Hm9LtFSY887UDvMt2qTXVa5zHaXbEHXWxfNT8vh_t3UGQp31rAN0EbVGZo8QqaGmKfMgPFqJ1rBYRjRx0SKHBofWBEEZczIHky7w_HdTbg:1mG6ry:d3YlSAsqyyesiuUv1nCmtS-OLG6kUbUsKP_oOHPLLOg','2021-08-31 21:43:38.669460');
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('c1h845vsizqgbsc28qg731rmb4phletv','.eJxVjEsOwjAMBe-SNYqcxK1dlux7hsqJAymgRupnhbg7VOoCtm9m3ssMsq1l2JY8D6Oas3Hm9LtFSY887UDvMt2qTXVa5zHaXbEHXWxfNT8vh_t3UGQp31rAN0EbVGZo8QqaGmKfMgPFqJ1rBYRjRx0SKHBofWBEEZczIHky7w_HdTbg:1mGTvT:CYiVQ3REa7dFmFpuQ9aCpRz477WSdS63ZFzpo-8VFi0','2021-09-01 22:20:47.058746');
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('4y5uj75gk2o0xcay2tke6vz0am906hgz','.eJxVjEsOwjAMBe-SNYqcxK1dlux7hsqJAymgRupnhbg7VOoCtm9m3ssMsq1l2JY8D6Oas3Hm9LtFSY887UDvMt2qTXVa5zHaXbEHXWxfNT8vh_t3UGQp31rAN0EbVGZo8QqaGmKfMgPFqJ1rBYRjRx0SKHBofWBEEZczIHky7w_HdTbg:1mHwpz:4AbvDRvxbWmvPcWTtDwVuHXdaFrr0oQRdb5jD54y1fI','2021-09-05 23:25:11.996245');
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('0fz4itdqcr4ryc2jdhwv7dxvng3kyys1','.eJxVjEsOwjAMBe-SNYqcxK1dlux7hsqJAymgRupnhbg7VOoCtm9m3ssMsq1l2JY8D6Oas3Hm9LtFSY887UDvMt2qTXVa5zHaXbEHXWxfNT8vh_t3UGQp31rAN0EbVGZo8QqaGmKfMgPFqJ1rBYRjRx0SKHBofWBEEZczIHky7w_HdTbg:1mHxRp:PmBTlFyWuBwrierjD5huDNZ88fww4FO0IMbF-QVnEvs','2021-09-06 00:04:17.189984');
INSERT INTO "core_eps" ("id","NEPS","NRQPS","processo","posicao_soldagem","especificacao","PN","faixa_esp","faixa_diam","especificacao_metal_ad","classificacao","FN","progressao_soldagem","qrcode") VALUES (1,'VCE-TG-AC -02','VCE-TG-AC -02','TIG','TODAS','ASTM A106M  (ASME IX)',1,'≤ 7,8 mm','TODOS','SFA 5.18','ER 70S3',6,'ASCENDENTE','/static/core/dist/img/TG_AC_02.png');
INSERT INTO "core_eps" ("id","NEPS","NRQPS","processo","posicao_soldagem","especificacao","PN","faixa_esp","faixa_diam","especificacao_metal_ad","classificacao","FN","progressao_soldagem","qrcode") VALUES (2,'VCE-TG-AI-02','VCE-TG-AI -02','TIG','TODAS','ASTM A312M  (ASME IX)',8,'≤ 5,6 mm','TODOS','SFA 5.9','ER 308L',6,'ASCENDENTE','/static/core/dist/img/QRCODE.png');
INSERT INTO "core_eps" ("id","NEPS","NRQPS","processo","posicao_soldagem","especificacao","PN","faixa_esp","faixa_diam","especificacao_metal_ad","classificacao","FN","progressao_soldagem","qrcode") VALUES (3,'VCE-ER-AC -02','VCE-ER-AC -02','ELETRODO REVESTIDO','PLANA / HORIZONTAL','ASTM A36 (AWS D1.1)',1,'> 3,0','> 600','A 5.1 M','E4918',0,'N/A','/static/core/dist/img/QRCODE_IZZC4Fd.png');
INSERT INTO "core_eps" ("id","NEPS","NRQPS","processo","posicao_soldagem","especificacao","PN","faixa_esp","faixa_diam","especificacao_metal_ad","classificacao","FN","progressao_soldagem","qrcode") VALUES (4,'VCE-TG-AI-03-VP','VCE-TG-AI-03-VP','TIG','TODAS','ASTM A240M  (ASME BPVC VIII',8,'5 – 38,1 mm','Não Limitado','SFA 5.14M','ER 308 L',6,'ASCENDENTE','/static/core/dist/img/QRCODE_yVFhakM.png');
INSERT INTO "core_eps" ("id","NEPS","NRQPS","processo","posicao_soldagem","especificacao","PN","faixa_esp","faixa_diam","especificacao_metal_ad","classificacao","FN","progressao_soldagem","qrcode") VALUES (5,'VCE-TG-AI-04-TA','VCE-TG-AI-04-TA','TIG','TODAS','ASTM A240M  (ASME BPVC VIII)',8,'5 – 38,1 mm','Não Limitado','SFA 5.14M','ER 308L',6,'ASCENDENTE','/static/core/dist/img/QRCODE_rLAK6ih.png');
INSERT INTO "core_eps" ("id","NEPS","NRQPS","processo","posicao_soldagem","especificacao","PN","faixa_esp","faixa_diam","especificacao_metal_ad","classificacao","FN","progressao_soldagem","qrcode") VALUES (6,'VCE-TG-AC-05-VP','VCE-TG-AC-05-VP','TIG','TODAS','ASTM A240M  (ASME BPVC VIII)',1,'5 – 38,1 mm','Não Limitado','SFA 5.18','ER 70S3',6,'ASCENDENTE','/static/core/dist/img/QRCODE_coA7rGS.png');
INSERT INTO "core_eps" ("id","NEPS","NRQPS","processo","posicao_soldagem","especificacao","PN","faixa_esp","faixa_diam","especificacao_metal_ad","classificacao","FN","progressao_soldagem","qrcode") VALUES (7,'VCE-TG-AC-06-TA','VCE-TG-AC-06-TA','TIG','TODAS','(API STD 620)',1,'5 – 38,1 mm','Não Limitado','SFA 5.18','ER 70S3',6,'ASCENDENTE','/static/core/dist/img/QRCODE_jXqrWMy.png');
INSERT INTO "core_eps" ("id","NEPS","NRQPS","processo","posicao_soldagem","especificacao","PN","faixa_esp","faixa_diam","especificacao_metal_ad","classificacao","FN","progressao_soldagem","qrcode") VALUES (8,'VCE-TG-AI-07-VP','VCE-TG-AI-07-VP','TIG','TODAS','ASTM A240M  (ASME BPVC VIII)',8,'1,5 -  5,6 mm','Não Limitado','SFA 5.9','ER 308L',6,'TIG ASCENDENTE / DESCENDENTE','/static/core/dist/img/QRCODE_4R1MYC9.jpeg');
INSERT INTO "core_eps" ("id","NEPS","NRQPS","processo","posicao_soldagem","especificacao","PN","faixa_esp","faixa_diam","especificacao_metal_ad","classificacao","FN","progressao_soldagem","qrcode") VALUES (9,'VCE-TG-AI-08-TA','VCE-TG-AI-08-TA','TIG','TODAS','ASTM A240M   (API STD 620)',8,'1,5 -  5,6 mm','Não Limitado','SFA 5.9','ER 308L',6,'TIG ASCENDENTE / DESCENDENTE','/static/core/dist/img/QRCODE_BUhE4ec.png');
INSERT INTO "core_eps" ("id","NEPS","NRQPS","processo","posicao_soldagem","especificacao","PN","faixa_esp","faixa_diam","especificacao_metal_ad","classificacao","FN","progressao_soldagem","qrcode") VALUES (10,'VCE-TG-AC-09-VP','VCE-TG-AC-09-VP','TIG','TODAS','(ASME BPVC VIII)',1,'1,50 – 7,8 mm','Não Limitado','SFA 5.18','ER 70S3',6,'TIG ASCENDENTE / DESCENDENTE','/static/core/dist/img/QRCODE_5RCxGHy.png');
INSERT INTO "core_eps" ("id","NEPS","NRQPS","processo","posicao_soldagem","especificacao","PN","faixa_esp","faixa_diam","especificacao_metal_ad","classificacao","FN","progressao_soldagem","qrcode") VALUES (11,'VCE-TG-AC-10-TA','VCE-TG-AC-10-TA','TIG','TODAS','(API STD 620)',1,'1,50 – 7,8 mm','Não Limitado','SFA 5.18','ER 70S3',6,'TIG ASCENDENTE / DESCENDENTE','/static/core/dist/img/QRCODE_vy9JPZ7.png');
INSERT INTO "core_eps" ("id","NEPS","NRQPS","processo","posicao_soldagem","especificacao","PN","faixa_esp","faixa_diam","especificacao_metal_ad","classificacao","FN","progressao_soldagem","qrcode") VALUES (12,'VCE-TG-625','VCE-TG-625','TIG','TODAS','ASTM A312M  (ASME BPVC VIII)',8,'≤ 7,8 mm','TODOS','SFA 5.14M','ER NiCrMo3',43,'TIG ASCENDENTE / DESCENDENTE','/static/core/dist/img/QRCODE_4R5j3Af.png');
INSERT INTO "admin_interface_theme" ("id","name","active","title","title_visible","logo_visible","css_header_background_color","css_header_text_color","css_header_link_color","css_header_link_hover_color","css_module_background_color","css_module_text_color","css_module_link_color","css_module_link_hover_color","css_module_rounded_corners","css_generic_link_color","css_generic_link_hover_color","css_save_button_background_color","css_save_button_background_hover_color","css_save_button_text_color","css_delete_button_background_color","css_delete_button_background_hover_color","css_delete_button_text_color","css","list_filter_dropdown","related_modal_active","related_modal_background_color","related_modal_rounded_corners","logo_color","title_color","recent_actions_visible","favicon","related_modal_background_opacity","env_name","env_color","env_visible_in_header","env_visible_in_favicon","related_modal_close_button_visible","language_chooser_active","language_chooser_display","list_filter_sticky","form_pagination_sticky","form_submit_sticky","css_module_background_selected_color","css_module_link_selected_color","logo") VALUES (2,'Django',1,'VCE CONTROLES',1,1,'#2F3233','#E5DDDF','#FFFFFF','#C9F0DD','#2F3233','#FFFFFF','#FFFFFF','#E5E2E2',1,'#2F3233','#E5E2E4','#2F3233','#B5B5B5','#FFFFFF','#BA2121','#A41515','#FFFFFF','',1,1,'#000000',1,'#FFFFFF','#F5F1F3',1,'','0.3','','#2F3233',1,1,1,1,'code',1,0,0,'#FFFFCC','#FFFFFF','admin-interface/logo/LOGO_VCE_FF3QTvU.png');
INSERT INTO "core_soldadores" ("id","sinete","nome","EPS","processo","modo_trensferencia","FN","metal_base","esp_chanfro","esp_angulo","diametro_chanfro","diametro_angulo","posiçao","progressao_soldagem","cobre_junta","notas","qrcode","validade","dados") VALUES (1,'S-01','José Gomes Pereira','VCE-TG-AC 02','GTAW','N/A',6,'1 @ 15F, 34, 41 @ 49 + similar','≤ 8,0','NL','≥ 25,0','NL','Todas All','Ascendente Upward','Com/Sem With/ Without','2 @ 4','/static/core/dist/img/Qr_code_S01.png','2021-06-29','https://drive.google.com/drive/folders/1zgq0D6_nKMlCJzQgIsp2XBx5A6Inm1Ds');
INSERT INTO "core_soldadores" ("id","sinete","nome","EPS","processo","modo_trensferencia","FN","metal_base","esp_chanfro","esp_angulo","diametro_chanfro","diametro_angulo","posiçao","progressao_soldagem","cobre_junta","notas","qrcode","validade","dados") VALUES (2,'S-01','José Gomes Pereira','VCE-TG- 625-01','GTAW','N/A',34,'1 @ 15F, 34, 41 @ 49 + similar','≤ 8,0','NL','≥ 25,0','NL','Todas All','Ascendente Upward','Com/Sem With/ Without','2 @ 4','/static/core/dist/img/Qr_code_S01.png','2021-06-29','https://drive.google.com/drive/folders/1zgq0D6_nKMlCJzQgIsp2XBx5A6Inm1Ds?usp=sharing');
INSERT INTO "core_soldadores" ("id","sinete","nome","EPS","processo","modo_trensferencia","FN","metal_base","esp_chanfro","esp_angulo","diametro_chanfro","diametro_angulo","posiçao","progressao_soldagem","cobre_junta","notas","qrcode","validade","dados") VALUES (3,'S-03','Ezequiel Alvez da Silva Soares','VCE-TG-AC 02','GTAW','N/A',6,'1 @ 15F, 34, 41 @ 49 + similar','≤ 8,0','NL','≥ 25,0','NL','Todas All','Ascendente Upward','Com/Sem With/ Without','2 @ 4','/static/core/dist/img/QRCODE_S3.jpeg','2021-09-24','https://drive.google.com/drive/folders/1XUnibSAVGr4U06UAOfOFb3VbyILI6dP1?usp=sharing');
INSERT INTO "core_soldadores" ("id","sinete","nome","EPS","processo","modo_trensferencia","FN","metal_base","esp_chanfro","esp_angulo","diametro_chanfro","diametro_angulo","posiçao","progressao_soldagem","cobre_junta","notas","qrcode","validade","dados") VALUES (4,'S-03','Ezequiel Alvez da Silva Soares','VCE-TG- 625-01','GTAW','N/A',34,'1 @ 15F, 34, 41 @ 49 + similar','≤ 8,0','NL','≥ 25,0','NL','Todas All','Ascendente Upward','Com/Sem With/ Without','2 @ 4','/static/core/dist/img/QRCODE_S3.jpeg','2021-09-24','https://drive.google.com/drive/folders/1XUnibSAVGr4U06UAOfOFb3VbyILI6dP1?usp=sharing');
INSERT INTO "core_soldadores" ("id","sinete","nome","EPS","processo","modo_trensferencia","FN","metal_base","esp_chanfro","esp_angulo","diametro_chanfro","diametro_angulo","posiçao","progressao_soldagem","cobre_junta","notas","qrcode","validade","dados") VALUES (5,'S-04','Hilário Fernandes','VCE-TG-AC 02','GTAW','N/A',6,'1 @ 15F, 34, 41 @ 49 + similar','≤ 8,0','NL','≥ 25,0','NL','Todas All','Ascendente Upward','Com/Sem With/ Without','2 @ 4','/static/core/dist/img/Qr_code_S04.png','2021-06-28','https://drive.google.com/drive/folders/1aUoF-2tGRbMF4Hq63T51iKK11jDtlnn1?usp=sharing');
INSERT INTO "core_soldadores" ("id","sinete","nome","EPS","processo","modo_trensferencia","FN","metal_base","esp_chanfro","esp_angulo","diametro_chanfro","diametro_angulo","posiçao","progressao_soldagem","cobre_junta","notas","qrcode","validade","dados") VALUES (6,'S-06','Edivaldo da Silva Temoteo','VCE-TG-AC 02','GTAW','N/A',6,'1 @ 15F, 34, 41 @ 49 + similar','≤ 8,0','NL','≥ 25,0','NL','Plana Flat','Ascendente Upward','Com/With','2 @ 4','/static/core/dist/img/Qr_code_S06.png','2021-09-10','https://drive.google.com/drive/folders/1QBaB01PJ7W5thyH8rJP5PyNiTM5a3mC8?usp=sharing');
INSERT INTO "core_soldadores" ("id","sinete","nome","EPS","processo","modo_trensferencia","FN","metal_base","esp_chanfro","esp_angulo","diametro_chanfro","diametro_angulo","posiçao","progressao_soldagem","cobre_junta","notas","qrcode","validade","dados") VALUES (7,'S-06','Edivaldo da Silva Temoteo','VCE-TG-AC 02','GTAW','N/A',6,'1 @ 15F, 34, 41 @ 49 + similar','NL','NL','≥ 73,0','NL','Plana Flat','N/A','Com/With','2 @ 4','/static/core/dist/img/Qr_code_S06.png','2021-09-10','https://drive.google.com/drive/folders/1QBaB01PJ7W5thyH8rJP5PyNiTM5a3mC8?usp=sharing');
INSERT INTO "core_soldadores" ("id","sinete","nome","EPS","processo","modo_trensferencia","FN","metal_base","esp_chanfro","esp_angulo","diametro_chanfro","diametro_angulo","posiçao","progressao_soldagem","cobre_junta","notas","qrcode","validade","dados") VALUES (8,'S-07','Daflei Augusto Carriel da Silva','VCE-TG-AC 02','GTAW','N/A',6,'1 @ 15F, 34, 41 @ 49 + similar','≤ 8,0','NL','≥ 25,0','NL','Todas All','Ascendente Upward','Com/Sem With/ Without','2 @ 4','/static/core/dist/img/Qr_code_S07.png','2021-06-29','https://drive.google.com/drive/folders/15mG17l36PCSHNBSGf_p14knt6AvPwElL?usp=sharing');
INSERT INTO "core_soldadores" ("id","sinete","nome","EPS","processo","modo_trensferencia","FN","metal_base","esp_chanfro","esp_angulo","diametro_chanfro","diametro_angulo","posiçao","progressao_soldagem","cobre_junta","notas","qrcode","validade","dados") VALUES (9,'S-11','Marcio Nunes de Medeiros','VCE-TG-AC 02','GTAW','N/A',6,'1 @ 15F, 34, 41 @ 49 + similar','≤ 8,0','NL','≥ 25,0','NL','Todas All','Ascendente Upward','Com/Sem With/ Without','2 @ 4','/static/core/dist/img/QRCODE_S11.jpeg','2021-09-22','https://drive.google.com/drive/folders/1qS9Fc08Ji4yvm8YOBiMvWSfogM4rWbCv?usp=sharing');
DROP INDEX IF EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq";
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
DROP INDEX IF EXISTS "auth_group_permissions_group_id_b120cbf9";
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
DROP INDEX IF EXISTS "auth_group_permissions_permission_id_84c5c92e";
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
DROP INDEX IF EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq";
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
DROP INDEX IF EXISTS "auth_user_groups_user_id_6a12ed8b";
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
DROP INDEX IF EXISTS "auth_user_groups_group_id_97559544";
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
DROP INDEX IF EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq";
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
DROP INDEX IF EXISTS "auth_user_user_permissions_user_id_a95ead1b";
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
DROP INDEX IF EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c";
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
DROP INDEX IF EXISTS "django_admin_log_content_type_id_c4bce8eb";
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
DROP INDEX IF EXISTS "django_admin_log_user_id_c564eba6";
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
DROP INDEX IF EXISTS "django_content_type_app_label_model_76bd3d3b_uniq";
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
DROP INDEX IF EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq";
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
DROP INDEX IF EXISTS "auth_permission_content_type_id_2f476e4b";
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
DROP INDEX IF EXISTS "django_session_expire_date_a5c62663";
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
COMMIT;
