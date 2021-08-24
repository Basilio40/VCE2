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
INSERT INTO "core_eps" VALUES (1,'VCE-TG-AC -02','VCE-TG-AC -02','TIG','TODAS','ASTM A106M  (ASME IX)',1,'≤ 7,8 mm','TODOS','SFA 5.18','ER 70S3',6,'ASCENDENTE','/static/core/dist/img/TG_AC_02.png');
INSERT INTO "core_eps" VALUES (2,'VCE-TG-AI-02','VCE-TG-AI -02','TIG','TODAS','ASTM A312M  (ASME IX)',8,'≤ 5,6 mm','TODOS','SFA 5.9','ER 308L',6,'ASCENDENTE','/static/core/dist/img/QRCODE.png');
INSERT INTO "core_eps" VALUES (3,'VCE-ER-AC -02','VCE-ER-AC -02','ELETRODO REVESTIDO','PLANA / HORIZONTAL','ASTM A36 (AWS D1.1)',1,'> 3,0','> 600','A 5.1 M','E4918',0,'N/A','/static/core/dist/img/QRCODE_IZZC4Fd.png');
INSERT INTO "core_eps" VALUES (4,'VCE-TG-AI-03-VP','VCE-TG-AI-03-VP','TIG','TODAS','ASTM A240M  (ASME BPVC VIII',8,'5 – 38,1 mm','Não Limitado','SFA 5.14M','ER 308 L',6,'ASCENDENTE','/static/core/dist/img/QRCODE_yVFhakM.png');
INSERT INTO "core_eps" VALUES (5,'VCE-TG-AI-04-TA','VCE-TG-AI-04-TA','TIG','TODAS','ASTM A240M  (ASME BPVC VIII)',8,'5 – 38,1 mm','Não Limitado','SFA 5.14M','ER 308L',6,'ASCENDENTE','/static/core/dist/img/QRCODE_rLAK6ih.png');
INSERT INTO "core_eps" VALUES (6,'VCE-TG-AC-05-VP','VCE-TG-AC-05-VP','TIG','TODAS','ASTM A240M  (ASME BPVC VIII)',1,'5 – 38,1 mm','Não Limitado','SFA 5.18','ER 70S3',6,'ASCENDENTE','/static/core/dist/img/QRCODE_coA7rGS.png');
INSERT INTO "core_eps" VALUES (7,'VCE-TG-AC-06-TA','VCE-TG-AC-06-TA','TIG','TODAS','(API STD 620)',1,'5 – 38,1 mm','Não Limitado','SFA 5.18','ER 70S3',6,'ASCENDENTE','/static/core/dist/img/QRCODE_jXqrWMy.png');
INSERT INTO "core_eps" VALUES (8,'VCE-TG-AI-07-VP','VCE-TG-AI-07-VP','TIG','TODAS','ASTM A240M  (ASME BPVC VIII)',8,'1,5 -  5,6 mm','Não Limitado','SFA 5.9','ER 308L',6,'TIG ASCENDENTE / DESCENDENTE','/static/core/dist/img/QRCODE_4R1MYC9.jpeg');
INSERT INTO "core_eps" VALUES (9,'VCE-TG-AI-08-TA','VCE-TG-AI-08-TA','TIG','TODAS','ASTM A240M   (API STD 620)',8,'1,5 -  5,6 mm','Não Limitado','SFA 5.9','ER 308L',6,'TIG ASCENDENTE / DESCENDENTE','/static/core/dist/img/QRCODE_BUhE4ec.png');
INSERT INTO "core_eps" VALUES (10,'VCE-TG-AC-09-VP','VCE-TG-AC-09-VP','TIG','TODAS','(ASME BPVC VIII)',1,'1,50 – 7,8 mm','Não Limitado','SFA 5.18','ER 70S3',6,'TIG ASCENDENTE / DESCENDENTE','/static/core/dist/img/QRCODE_5RCxGHy.png');
INSERT INTO "core_eps" VALUES (11,'VCE-TG-AC-10-TA','VCE-TG-AC-10-TA','TIG','TODAS','(API STD 620)',1,'1,50 – 7,8 mm','Não Limitado','SFA 5.18','ER 70S3',6,'TIG ASCENDENTE / DESCENDENTE','/static/core/dist/img/QRCODE_vy9JPZ7.png');
INSERT INTO "core_eps" VALUES (12,'VCE-TG-625','VCE-TG-625','TIG','TODAS','ASTM A312M  (ASME BPVC VIII)',8,'≤ 7,8 mm','TODOS','SFA 5.14M','ER NiCrMo3',43,'TIG ASCENDENTE / DESCENDENTE','/static/core/dist/img/QRCODE_4R5j3Af.png');
COMMIT;
