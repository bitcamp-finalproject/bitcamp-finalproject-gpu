-- 회원
DROP TABLE IF EXISTS aim_member RESTRICT;

-- 정보비공개설정
DROP TABLE IF EXISTS aim_hide_setting RESTRICT;

-- 차단회원목록
DROP TABLE IF EXISTS aim_ban_member RESTRICT;

-- 게시글
DROP TABLE IF EXISTS aim_board RESTRICT;

-- 팔로우
DROP TABLE IF EXISTS aim_follow RESTRICT;

-- 삭제한 회원
DROP TABLE IF EXISTS aim_del_member RESTRICT;

-- 댓글
DROP TABLE IF EXISTS aim_reply RESTRICT;

-- FAQ
DROP TABLE IF EXISTS aim_faq RESTRICT;

-- 포인트로그
DROP TABLE IF EXISTS aim_pt_get_log RESTRICT;

-- 그림
DROP TABLE IF EXISTS aim_generated_img RESTRICT;

-- 회원알림설정
DROP TABLE IF EXISTS aim_alarm RESTRICT;

-- 알림로그
DROP TABLE IF EXISTS aim_alarm_log RESTRICT;

-- 활동유형별포인트
DROP TABLE IF EXISTS aim_get_type RESTRICT;

-- 게시글좋아요
DROP TABLE IF EXISTS aim_like_board RESTRICT;

-- 댓글좋아요
DROP TABLE IF EXISTS aim_like_reply RESTRICT;

-- 신고유형
DROP TABLE IF EXISTS aim_report RESTRICT;

-- 게시글신고
DROP TABLE IF EXISTS aim_report_board RESTRICT;

-- 댓글신고
DROP TABLE IF EXISTS aim_report_reply RESTRICT;

-- 알림유형
DROP TABLE IF EXISTS aim_alarm_type RESTRICT;

-- 정보항목
DROP TABLE IF EXISTS aim_info_list RESTRICT;

-- 공개범위
DROP TABLE IF EXISTS aim_public_range RESTRICT;

-- FAQ유형
DROP TABLE IF EXISTS aim_faq_type RESTRICT;

-- 회원
CREATE TABLE aim_member (
  member_no    INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
  name         VARCHAR(50)  NOT NULL COMMENT '닉네임', -- 닉네임
  email        VARCHAR(40)  NOT NULL COMMENT '이메일', -- 이메일
  pw           VARCHAR(64)  NOT NULL COMMENT '비밀번호', -- 비밀번호
  created_dt   DATETIME     NOT NULL DEFAULT now() COMMENT '가입일', -- 가입일
  gender       BOOLEAN      NULL     COMMENT '성별', -- 성별
  filename     VARCHAR(255) NULL     COMMENT '프로필사진명', -- 프로필사진명
  addr         VARCHAR(255) NULL     COMMENT '기본주소', -- 기본주소
  pt           INTEGER      NOT NULL COMMENT '포인트', -- 포인트
  info         VARCHAR(150) NULL     COMMENT '자기소개글', -- 자기소개글
  birth_dt     CHAR(6)      NULL     COMMENT '생년월일', -- 생년월일
  tel          VARCHAR(30)  NULL     COMMENT '전화번호', -- 전화번호
  pw_update_dt DATETIME     NOT NULL DEFAULT now() COMMENT '비밀번호 변경일시', -- 비밀번호 변경일시
  state        INTEGER      NOT NULL DEFAULT 0 COMMENT '0: 정상, 1: 미인증, 2: 휴면, 3: 탈퇴, 4: 추방', -- 계정상태
  auth         INTEGER      NOT NULL DEFAULT 0 COMMENT '0: 일반, 9: 관리자' -- 권한레벨
)
COMMENT '회원';

-- 회원
ALTER TABLE aim_member
  ADD CONSTRAINT PK_aim_member -- 회원 기본키
  PRIMARY KEY (
  member_no -- 회원번호
  );

-- 회원 유니크 인덱스
CREATE UNIQUE INDEX UIX_aim_member
  ON aim_member ( -- 회원
    name ASC,  -- 닉네임
    email ASC  -- 이메일
  );

ALTER TABLE aim_member
  MODIFY COLUMN member_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '회원번호';

-- 정보비공개설정
CREATE TABLE aim_hide_setting (
  member_no INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
  no        INTEGER NOT NULL COMMENT '항목번호', -- 항목번호
  range_no  INTEGER NOT NULL COMMENT '공개범위번호' -- 공개범위번호
)
COMMENT '정보비공개설정';

-- 정보비공개설정
ALTER TABLE aim_hide_setting
  ADD CONSTRAINT PK_aim_hide_setting -- 정보비공개설정 기본키
  PRIMARY KEY (
  member_no, -- 회원번호
  no         -- 항목번호
  );

-- 차단회원목록
CREATE TABLE aim_ban_member (
  member_no     INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
  ban_member_no INTEGER NOT NULL COMMENT '차단대상회원번호' -- 차단대상회원번호
)
COMMENT '차단회원목록';

-- 차단회원목록
ALTER TABLE aim_ban_member
  ADD CONSTRAINT PK_aim_ban_member -- 차단회원목록 기본키
  PRIMARY KEY (
  member_no,     -- 회원번호
  ban_member_no  -- 차단대상회원번호
  );

-- 게시글
CREATE TABLE aim_board (
  board_no       INTEGER      NOT NULL COMMENT '게시글 번호', -- 게시글 번호
  member_no      INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
  origin_content TEXT         NOT NULL COMMENT '원본내용', -- 원본내용
  trans_content  TEXT         NOT NULL COMMENT '번역내용', -- 번역내용
  tag            VARCHAR(255) NULL     COMMENT '#태그', -- #태그
  like_cnt       INTEGER      NOT NULL DEFAULT 0 COMMENT '좋아요', -- 좋아요
  view_cnt       INTEGER      NOT NULL DEFAULT 0 COMMENT '조회수', -- 조회수
  board_public   INTEGER      NOT NULL DEFAULT 1 COMMENT '0: 비공개, 1: 모두공개', -- 게시글공개여부
  reply_public   INTEGER      NOT NULL DEFAULT 1 COMMENT '0: 비공개, 1: 모두공개', -- 댓글공개여부
  write_dt       DATETIME     NOT NULL DEFAULT now() COMMENT '작성일', -- 작성일
  update_dt      DATETIME     NOT NULL DEFAULT now() COMMENT '수정일', -- 수정일
  report_cnt     INTEGER      NOT NULL DEFAULT 0 COMMENT '신고횟수' -- 신고횟수
)
COMMENT '게시글';

-- 게시글
ALTER TABLE aim_board
  ADD CONSTRAINT PK_aim_board -- 게시글 기본키
  PRIMARY KEY (
  board_no -- 게시글 번호
  );

ALTER TABLE aim_board
  MODIFY COLUMN board_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '게시글 번호';

-- 팔로우
CREATE TABLE aim_follow (
  following_no INTEGER  NOT NULL COMMENT '팔로잉회원번호', -- 팔로잉회원번호
  follower_no  INTEGER  NOT NULL COMMENT '팔로워회원번호', -- 팔로워회원번호
  following_dt DATETIME NOT NULL DEFAULT now() COMMENT '팔로잉일시' -- 팔로잉일시
)
COMMENT '팔로우';

-- 팔로우
ALTER TABLE aim_follow
  ADD CONSTRAINT PK_aim_follow -- 팔로우 기본키
  PRIMARY KEY (
  following_no, -- 팔로잉회원번호
  follower_no   -- 팔로워회원번호
  );

-- 삭제한 회원
CREATE TABLE aim_del_member (
  member_no  INTEGER  NOT NULL COMMENT '회원번호', -- 회원번호
  del_reason TEXT     NULL     COMMENT '삭제사유', -- 삭제사유
  del_dt     DATETIME NOT NULL DEFAULT now() COMMENT '삭제일시' -- 삭제일시
)
COMMENT '삭제한 회원';

-- 삭제한 회원
ALTER TABLE aim_del_member
  ADD CONSTRAINT PK_aim_del_member -- 삭제한 회원 기본키
  PRIMARY KEY (
  member_no -- 회원번호
  );

-- 댓글
CREATE TABLE aim_reply (
  reply_no  INTEGER  NOT NULL COMMENT '댓글번호', -- 댓글번호
  board_no  INTEGER  NOT NULL COMMENT '게시글 번호', -- 게시글 번호
  member_no INTEGER  NOT NULL COMMENT '회원번호', -- 회원번호
  content   TEXT     NOT NULL COMMENT '내용', -- 내용
  write_dt  DATETIME NOT NULL DEFAULT now() COMMENT '작성일시' -- 작성일시
)
COMMENT '댓글';

-- 댓글
ALTER TABLE aim_reply
  ADD CONSTRAINT PK_aim_reply -- 댓글 기본키
  PRIMARY KEY (
  reply_no -- 댓글번호
  );

ALTER TABLE aim_reply
  MODIFY COLUMN reply_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '댓글번호';

-- FAQ
CREATE TABLE aim_faq (
  faq_no      INTEGER      NOT NULL COMMENT 'FAQ번호', -- FAQ번호
  faq_type_no INTEGER      NULL     COMMENT '문의유형번호', -- 문의유형번호
  title       VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
  content     TEXT         NOT NULL COMMENT '내용', -- 내용
  write_dt    DATETIME     NOT NULL DEFAULT now() COMMENT '작성일시' -- 작성일시
)
COMMENT 'FAQ';

-- FAQ
ALTER TABLE aim_faq
  ADD CONSTRAINT PK_aim_faq -- FAQ 기본키
  PRIMARY KEY (
  faq_no -- FAQ번호
  );

-- FAQ 인덱스
CREATE INDEX IX_aim_faq
  ON aim_faq( -- FAQ
    title ASC -- 제목
  );

ALTER TABLE aim_faq
  MODIFY COLUMN faq_no INTEGER NOT NULL AUTO_INCREMENT COMMENT 'FAQ번호';

-- 포인트로그
CREATE TABLE aim_pt_get_log (
  get_log_no     INTEGER  NOT NULL COMMENT '포인트로그번호', -- 포인트로그번호
  get_type       INTEGER  NOT NULL COMMENT '활동유형', -- 활동유형
  get_member_no  INTEGER  NOT NULL COMMENT '받는이번호', -- 받는이번호
  send_member_no INTEGER  NOT NULL COMMENT '보내는이번호', -- 보내는이번호
  board_no       INTEGER  NOT NULL COMMENT '게시글 번호', -- 게시글 번호
  get_pt         INTEGER  NOT NULL DEFAULT 0 COMMENT '포인트', -- 포인트
  get_dt         DATETIME NOT NULL DEFAULT now() COMMENT '로그일시' -- 로그일시
)
COMMENT '포인트로그';

-- 포인트로그
ALTER TABLE aim_pt_get_log
  ADD CONSTRAINT PK_aim_pt_get_log -- 포인트로그 기본키
  PRIMARY KEY (
  get_log_no -- 포인트로그번호
  );

ALTER TABLE aim_pt_get_log
  MODIFY COLUMN get_log_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '포인트로그번호';

-- 그림
CREATE TABLE aim_generated_img (
  img_no   INTEGER      NOT NULL COMMENT '그림번호', -- 그림번호
  img_filename VARCHAR(255) NOT NULL COMMENT '파일이름', -- 파일이름
  board_no INTEGER      NOT NULL COMMENT '게시글 번호' -- 게시글 번호
)
COMMENT '그림';

-- 그림
ALTER TABLE aim_generated_img
  ADD CONSTRAINT PK_aim_generated_img -- 그림 기본키
  PRIMARY KEY (
  img_no -- 그림번호
  );

-- 그림 유니크 인덱스
CREATE UNIQUE INDEX UIX_aim_generated_img
  ON aim_generated_img ( -- 그림
    filename ASC -- 파일이름
  );

ALTER TABLE aim_generated_img
  MODIFY COLUMN img_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '그림번호';

-- 회원알림설정
CREATE TABLE aim_alarm (
  member_no INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
  type      INTEGER NOT NULL COMMENT '알림유형번호' -- 알림유형번호
)
COMMENT '회원알림설정';

-- 회원알림설정
ALTER TABLE aim_alarm
  ADD CONSTRAINT PK_aim_alarm -- 회원알림설정 기본키
  PRIMARY KEY (
  member_no, -- 회원번호
  type       -- 알림유형번호
  );

-- 알림로그
CREATE TABLE aim_alarm_log (
  log_no    INTEGER  NOT NULL COMMENT '알림로그번호', -- 알림로그번호
  type_no   INTEGER  NOT NULL COMMENT '알림유형번호', -- 알림유형번호
  member_no INTEGER  NOT NULL COMMENT '회원번호', -- 회원번호
  content   TEXT     NOT NULL COMMENT '알림내용', -- 알림내용
  read_flag BOOLEAN  NOT NULL DEFAULT 0 COMMENT '읽음여부', -- 읽음여부
  alarm_dt  DATETIME NOT NULL DEFAULT now() COMMENT '알림일' -- 알림일
)
COMMENT '알림로그';

-- 알림로그
ALTER TABLE aim_alarm_log
  ADD CONSTRAINT PK_aim_alarm_log -- 알림로그 기본키
  PRIMARY KEY (
  log_no -- 알림로그번호
  );

ALTER TABLE aim_alarm_log
  MODIFY COLUMN log_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '알림로그번호';

-- 활동유형별포인트
CREATE TABLE aim_get_type (
  get_type INTEGER      NOT NULL COMMENT '활동유형', -- 활동유형
  get_name VARCHAR(255) NOT NULL COMMENT '활동명', -- 활동명
  pt       INTEGER      NOT NULL COMMENT '포인트' -- 포인트
)
COMMENT '활동유형별포인트';

-- 활동유형별포인트
ALTER TABLE aim_get_type
  ADD CONSTRAINT PK_aim_get_type -- 활동유형별포인트 기본키
  PRIMARY KEY (
  get_type -- 활동유형
  );

ALTER TABLE aim_get_type
  MODIFY COLUMN get_type INTEGER NOT NULL AUTO_INCREMENT COMMENT '활동유형';

-- 게시글좋아요
CREATE TABLE aim_like_board (
  board_no  INTEGER NOT NULL COMMENT '게시글 번호', -- 게시글 번호
  member_no INTEGER NOT NULL COMMENT '회원번호' -- 회원번호
)
COMMENT '게시글좋아요';

-- 게시글좋아요
ALTER TABLE aim_like_board
  ADD CONSTRAINT PK_aim_like_board -- 게시글좋아요 기본키
  PRIMARY KEY (
  board_no,  -- 게시글 번호
  member_no  -- 회원번호
  );

-- 댓글좋아요
CREATE TABLE aim_like_reply (
  reply_no  INTEGER NOT NULL COMMENT '댓글번호', -- 댓글번호
  member_no INTEGER NOT NULL COMMENT '회원번호' -- 회원번호
)
COMMENT '댓글좋아요';

-- 댓글좋아요
ALTER TABLE aim_like_reply
  ADD CONSTRAINT PK_aim_like_reply -- 댓글좋아요 기본키
  PRIMARY KEY (
  reply_no,  -- 댓글번호
  member_no  -- 회원번호
  );

-- 신고유형
CREATE TABLE aim_report (
  report_no   INTEGER NOT NULL COMMENT '신고유형번호', -- 신고유형번호
  report_type INTEGER NOT NULL COMMENT '논의 후 확정' -- 신고유형명
)
COMMENT '신고유형';

-- 신고유형
ALTER TABLE aim_report
  ADD CONSTRAINT PK_aim_report -- 신고유형 기본키
  PRIMARY KEY (
  report_no -- 신고유형번호
  );

ALTER TABLE aim_report
  MODIFY COLUMN report_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '신고유형번호';

-- 게시글신고
CREATE TABLE aim_report_board (
  board_no       INTEGER  NOT NULL COMMENT '게시글 번호', -- 게시글 번호
  member_no      INTEGER  NOT NULL COMMENT '회원번호', -- 회원번호
  report_no      INTEGER  NOT NULL COMMENT '신고유형번호', -- 신고유형번호
  report_dt      DATETIME NOT NULL DEFAULT now() COMMENT '신고일시', -- 신고일시
  report_content TEXT     NULL     COMMENT '신고내용' -- 신고내용
)
COMMENT '게시글신고';

-- 게시글신고
ALTER TABLE aim_report_board
  ADD CONSTRAINT PK_aim_report_board -- 게시글신고 기본키
  PRIMARY KEY (
  board_no,  -- 게시글 번호
  member_no  -- 회원번호
  );

-- 댓글신고
CREATE TABLE aim_report_reply (
  reply_no       INTEGER  NOT NULL COMMENT '댓글번호', -- 댓글번호
  member_no      INTEGER  NOT NULL COMMENT '신고자번호', -- 신고자번호
  report_no      INTEGER  NOT NULL COMMENT '신고유형번호', -- 신고유형번호
  report_dt      DATETIME NOT NULL DEFAULT now() COMMENT '신고일시', -- 신고일시
  report_content TEXT     NULL     COMMENT '신고내용' -- 신고내용
)
COMMENT '댓글신고';

-- 댓글신고
ALTER TABLE aim_report_reply
  ADD CONSTRAINT PK_aim_report_reply -- 댓글신고 기본키
  PRIMARY KEY (
  reply_no,  -- 댓글번호
  member_no  -- 신고자번호
  );

-- 알림유형
CREATE TABLE aim_alarm_type (
  type_no    INTEGER     NOT NULL COMMENT '알림유형번호', -- 알림유형번호
  alarm_type VARCHAR(50) NOT NULL COMMENT '논의 후 확정' -- 알림종류
)
COMMENT '알림유형';

-- 알림유형
ALTER TABLE aim_alarm_type
  ADD CONSTRAINT PK_aim_alarm_type -- 알림유형 기본키
  PRIMARY KEY (
  type_no -- 알림유형번호
  );

ALTER TABLE aim_alarm_type
  MODIFY COLUMN type_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '알림유형번호';

-- 정보항목
CREATE TABLE aim_info_list (
  no   INTEGER     NOT NULL COMMENT '항목번호', -- 항목번호
  name VARCHAR(50) NOT NULL COMMENT '항목명' -- 항목명
)
COMMENT '정보항목';

-- 정보항목
ALTER TABLE aim_info_list
  ADD CONSTRAINT PK_aim_info_list -- 정보항목 기본키
  PRIMARY KEY (
  no -- 항목번호
  );

ALTER TABLE aim_info_list
  MODIFY COLUMN no INTEGER NOT NULL AUTO_INCREMENT COMMENT '항목번호';

-- 공개범위
CREATE TABLE aim_public_range (
  range_no INTEGER NOT NULL COMMENT '공개범위번호', -- 공개범위번호
  state    INTEGER NOT NULL DEFAULT 2 COMMENT '0: 비공개, 1: 팔로워, 2: 모두공개' -- 공개상태
)
COMMENT '공개범위';

-- 공개범위
ALTER TABLE aim_public_range
  ADD CONSTRAINT PK_aim_public_range -- 공개범위 기본키
  PRIMARY KEY (
  range_no -- 공개범위번호
  );

ALTER TABLE aim_public_range
  MODIFY COLUMN range_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '공개범위번호';

-- FAQ유형
CREATE TABLE aim_faq_type (
  faq_type_no INTEGER      NOT NULL COMMENT '문의유형번호', -- 문의유형번호
  faq_type    VARCHAR(255) NOT NULL COMMENT '문의유형' -- 문의유형
)
COMMENT 'FAQ유형';

-- FAQ유형
ALTER TABLE aim_faq_type
  ADD CONSTRAINT PK_aim_faq_type -- FAQ유형 기본키
  PRIMARY KEY (
  faq_type_no -- 문의유형번호
  );

-- 정보비공개설정
ALTER TABLE aim_hide_setting
  ADD CONSTRAINT FK_aim_info_list_TO_aim_hide_setting -- 정보항목 -> 정보비공개설정
  FOREIGN KEY (
  no -- 항목번호
  )
  REFERENCES aim_info_list ( -- 정보항목
  no -- 항목번호
  );

-- 정보비공개설정
ALTER TABLE aim_hide_setting
  ADD CONSTRAINT FK_aim_member_TO_aim_hide_setting -- 회원 -> 정보비공개설정
  FOREIGN KEY (
  member_no -- 회원번호
  )
  REFERENCES aim_member ( -- 회원
  member_no -- 회원번호
  );

-- 정보비공개설정
ALTER TABLE aim_hide_setting
  ADD CONSTRAINT FK_aim_public_range_TO_aim_hide_setting -- 공개범위 -> 정보비공개설정
  FOREIGN KEY (
  range_no -- 공개범위번호
  )
  REFERENCES aim_public_range ( -- 공개범위
  range_no -- 공개범위번호
  );

-- 차단회원목록
ALTER TABLE aim_ban_member
  ADD CONSTRAINT FK_aim_member_TO_aim_ban_member -- 회원 -> 차단회원목록
  FOREIGN KEY (
  member_no -- 회원번호
  )
  REFERENCES aim_member ( -- 회원
  member_no -- 회원번호
  );

-- 차단회원목록
ALTER TABLE aim_ban_member
  ADD CONSTRAINT FK_aim_member_TO_aim_ban_member2 -- 회원 -> 차단회원목록2
  FOREIGN KEY (
  ban_member_no -- 차단대상회원번호
  )
  REFERENCES aim_member ( -- 회원
  member_no -- 회원번호
  );

-- 게시글
ALTER TABLE aim_board
  ADD CONSTRAINT FK_aim_member_TO_aim_board -- 회원 -> 게시글
  FOREIGN KEY (
  member_no -- 회원번호
  )
  REFERENCES aim_member ( -- 회원
  member_no -- 회원번호
  );

-- 팔로우
ALTER TABLE aim_follow
  ADD CONSTRAINT FK_aim_member_TO_aim_follow -- 회원 -> 팔로우
  FOREIGN KEY (
  follower_no -- 팔로워회원번호
  )
  REFERENCES aim_member ( -- 회원
  member_no -- 회원번호
  );

-- 팔로우
ALTER TABLE aim_follow
  ADD CONSTRAINT FK_aim_member_TO_aim_follow2 -- 회원 -> 팔로우2
  FOREIGN KEY (
  following_no -- 팔로잉회원번호
  )
  REFERENCES aim_member ( -- 회원
  member_no -- 회원번호
  );

-- 삭제한 회원
ALTER TABLE aim_del_member
  ADD CONSTRAINT FK_aim_member_TO_aim_del_member -- 회원 -> 삭제한 회원
  FOREIGN KEY (
  member_no -- 회원번호
  )
  REFERENCES aim_member ( -- 회원
  member_no -- 회원번호
  );

-- 댓글
ALTER TABLE aim_reply
  ADD CONSTRAINT FK_aim_board_TO_aim_reply -- 게시글 -> 댓글
  FOREIGN KEY (
  board_no -- 게시글 번호
  )
  REFERENCES aim_board ( -- 게시글
  board_no -- 게시글 번호
  );

-- 댓글
ALTER TABLE aim_reply
  ADD CONSTRAINT FK_aim_member_TO_aim_reply -- 회원 -> 댓글
  FOREIGN KEY (
  member_no -- 회원번호
  )
  REFERENCES aim_member ( -- 회원
  member_no -- 회원번호
  );

-- FAQ
ALTER TABLE aim_faq
  ADD CONSTRAINT FK_aim_faq_type_TO_aim_faq -- FAQ유형 -> FAQ
  FOREIGN KEY (
  faq_type_no -- 문의유형번호
  )
  REFERENCES aim_faq_type ( -- FAQ유형
  faq_type_no -- 문의유형번호
  );

-- 포인트로그
ALTER TABLE aim_pt_get_log
  ADD CONSTRAINT FK_aim_member_TO_aim_pt_get_log -- 회원 -> 포인트로그
  FOREIGN KEY (
  get_member_no -- 받는이번호
  )
  REFERENCES aim_member ( -- 회원
  member_no -- 회원번호
  );

-- 포인트로그
ALTER TABLE aim_pt_get_log
  ADD CONSTRAINT FK_aim_get_type_TO_aim_pt_get_log -- 활동유형별포인트 -> 포인트로그
  FOREIGN KEY (
  get_type -- 활동유형
  )
  REFERENCES aim_get_type ( -- 활동유형별포인트
  get_type -- 활동유형
  );

-- 포인트로그
ALTER TABLE aim_pt_get_log
  ADD CONSTRAINT FK_aim_member_TO_aim_pt_get_log2 -- 회원 -> 포인트로그2
  FOREIGN KEY (
  send_member_no -- 보내는이번호
  )
  REFERENCES aim_member ( -- 회원
  member_no -- 회원번호
  );

-- 포인트로그
ALTER TABLE aim_pt_get_log
  ADD CONSTRAINT FK_aim_board_TO_aim_pt_get_log -- 게시글 -> 포인트로그
  FOREIGN KEY (
  board_no -- 게시글 번호
  )
  REFERENCES aim_board ( -- 게시글
  board_no -- 게시글 번호
  );

-- 그림
ALTER TABLE aim_generated_img
  ADD CONSTRAINT FK_aim_board_TO_aim_generated_img -- 게시글 -> 그림
  FOREIGN KEY (
  board_no -- 게시글 번호
  )
  REFERENCES aim_board ( -- 게시글
  board_no -- 게시글 번호
  );

-- 회원알림설정
ALTER TABLE aim_alarm
  ADD CONSTRAINT FK_aim_alarm_type_TO_aim_alarm -- 알림유형 -> 회원알림설정
  FOREIGN KEY (
  type -- 알림유형번호
  )
  REFERENCES aim_alarm_type ( -- 알림유형
  type_no -- 알림유형번호
  );

-- 회원알림설정
ALTER TABLE aim_alarm
  ADD CONSTRAINT FK_aim_member_TO_aim_alarm -- 회원 -> 회원알림설정
  FOREIGN KEY (
  member_no -- 회원번호
  )
  REFERENCES aim_member ( -- 회원
  member_no -- 회원번호
  );

-- 알림로그
ALTER TABLE aim_alarm_log
  ADD CONSTRAINT FK_aim_member_TO_aim_alarm_log -- 회원 -> 알림로그
  FOREIGN KEY (
  member_no -- 회원번호
  )
  REFERENCES aim_member ( -- 회원
  member_no -- 회원번호
  );

-- 알림로그
ALTER TABLE aim_alarm_log
  ADD CONSTRAINT FK_aim_alarm_type_TO_aim_alarm_log -- 알림유형 -> 알림로그
  FOREIGN KEY (
  type_no -- 알림유형번호
  )
  REFERENCES aim_alarm_type ( -- 알림유형
  type_no -- 알림유형번호
  );

-- 게시글좋아요
ALTER TABLE aim_like_board
  ADD CONSTRAINT FK_aim_member_TO_aim_like_board -- 회원 -> 게시글좋아요
  FOREIGN KEY (
  member_no -- 회원번호
  )
  REFERENCES aim_member ( -- 회원
  member_no -- 회원번호
  );

-- 게시글좋아요
ALTER TABLE aim_like_board
  ADD CONSTRAINT FK_aim_board_TO_aim_like_board -- 게시글 -> 게시글좋아요
  FOREIGN KEY (
  board_no -- 게시글 번호
  )
  REFERENCES aim_board ( -- 게시글
  board_no -- 게시글 번호
  );

-- 댓글좋아요
ALTER TABLE aim_like_reply
  ADD CONSTRAINT FK_aim_member_TO_aim_like_reply -- 회원 -> 댓글좋아요
  FOREIGN KEY (
  member_no -- 회원번호
  )
  REFERENCES aim_member ( -- 회원
  member_no -- 회원번호
  );

-- 댓글좋아요
ALTER TABLE aim_like_reply
  ADD CONSTRAINT FK_aim_reply_TO_aim_like_reply -- 댓글 -> 댓글좋아요
  FOREIGN KEY (
  reply_no -- 댓글번호
  )
  REFERENCES aim_reply ( -- 댓글
  reply_no -- 댓글번호
  );

-- 게시글신고
ALTER TABLE aim_report_board
  ADD CONSTRAINT FK_aim_board_TO_aim_report_board -- 게시글 -> 게시글신고
  FOREIGN KEY (
  board_no -- 게시글 번호
  )
  REFERENCES aim_board ( -- 게시글
  board_no -- 게시글 번호
  );

-- 게시글신고
ALTER TABLE aim_report_board
  ADD CONSTRAINT FK_aim_member_TO_aim_report_board -- 회원 -> 게시글신고
  FOREIGN KEY (
  member_no -- 회원번호
  )
  REFERENCES aim_member ( -- 회원
  member_no -- 회원번호
  );

-- 게시글신고
ALTER TABLE aim_report_board
  ADD CONSTRAINT FK_aim_report_TO_aim_report_board -- 신고유형 -> 게시글신고
  FOREIGN KEY (
  report_no -- 신고유형번호
  )
  REFERENCES aim_report ( -- 신고유형
  report_no -- 신고유형번호
  );

-- 댓글신고
ALTER TABLE aim_report_reply
  ADD CONSTRAINT FK_aim_reply_TO_aim_report_reply -- 댓글 -> 댓글신고
  FOREIGN KEY (
  reply_no -- 댓글번호
  )
  REFERENCES aim_reply ( -- 댓글
  reply_no -- 댓글번호
  );

-- 댓글신고
ALTER TABLE aim_report_reply
  ADD CONSTRAINT FK_aim_member_TO_aim_report_reply -- 회원 -> 댓글신고
  FOREIGN KEY (
  member_no -- 신고자번호
  )
  REFERENCES aim_member ( -- 회원
  member_no -- 회원번호
  );

-- 댓글신고
ALTER TABLE aim_report_reply
  ADD CONSTRAINT FK_aim_report_TO_aim_report_reply -- 신고유형 -> 댓글신고
  FOREIGN KEY (
  report_no -- 신고유형번호
  )
  REFERENCES aim_report ( -- 신고유형
  report_no -- 신고유형번호
  );
  
-- 게시판에 요약내용 추가
-- 게시판에 summary_content 넣은 후 NOT NULL 설정하기
ALTER TABLE aim_board 
  ADD summary_content TEXT NULL AFTER origin_content COMMENT '요약내용' -- 요약내용
ALTER TABLE aim_board
  MODIFY COLUMN summary_content TEXT NOT NULL

-- 알림로그에 상대회원번호 추가
ALTER TABLE aim_alarm_log ADD other_no INTEGER NOT NULL AFTER member_no COMMENT '상대회원번호' -- 상대회원번호

-- 알림로그의 상대회원번호에 외래키 추가
ALTER TABLE aim_alarm_log
  ADD CONSTRAINT FK_aim_member_TO_aim_alarm_log2 -- 회원 -> 알림로그2
  FOREIGN KEY (
  other_no  -- 상대회원번호
  )
  REFERENCES aim_member (  -- 회원
  member_no  -- 회원번호
  );
  
-- 알림 로그에 게시글 번호 추가
-- 알림 로그에 board_no 에 외래키 추가
ALTER TABLE aim_alarm_log
  ADD board_no INTEGER NULL AFTER member_no COMMENT '게시글번호' -- 게시글번호
ALTER TABLE aim_alarm_log
  MODIFY CONSTRAINT FK_aim_board_TO_aim_alarm_log -- 게시글 -> 알림로그
  FOREIGN KEY (
  board_no -- 게시글번호
  ) 
  REFERENCES aim_board (
  board_no -- 게시글번호
  )
  
-- 회원 정보에 메일 인증 토큰 추가
-- 회원 정보의 state 컬럼 NOT NULL DEFAULT 1로 변경
ALTER TABLE aim_member
  ADD token VARCHAR(255) NULL COMMENT '인증토큰' -- 인증토큰
ALTER TABLE aim_member
  MODIFY COLUMN state INTEGER NOT NULL DEFAULT 1

-- 회원 정보(aim_member) 테이블의 name, email 컬럼 묶어서 유니크 설정에서 각각 유니크 설정으로 변경
ALTER TABLE aim_member
DROP INDEX UIX_aim_member;

ALTER TABLE aim_member
ADD UNIQUE INDEX UIX_aim_member_name (name ASC);

ALTER TABLE aim_member
ADD UNIQUE INDEX UIX_aim_member_email (email ASC);

-- 회원 정보(aim_member)에 외부 계정 정보 추가
ALTER TABLE aim_member
  ADD link VARCHAR(255) NOT NULL DEFAULT 'artify' COMMENT '외부계정연동정보', -- 외부계정연동정보

