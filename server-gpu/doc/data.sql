-- 신규 database 생성(studydb 사용?)
-- create database project;
-- use project;

-- 회원 insert
INSERT INTO aim_member (name, email, pw, gender, filename, addr, pt, info, birth_dt, tel, state, auth)
VALUES
('한대호', 'johnny@example.com', sha2('1111',256), 1, 'https://kr.object.ncloudstorage.com/bit-project/profilepic/1.png', 'Seoul, South Korea', 100, 'Hello, I am Johnny!', '200001', '010-1234-5678', 0, 9),
('전태산', 'jane@example.com', sha2('1111',256), 2, 'https://kr.object.ncloudstorage.com/bit-project/profilepic/2.png', 'New York, USA', 200, 'Nice to meet you!', '199812', '123-456-7890', 0, 9),
('오병현', 'jake@example.com', sha2('1111',256), 1, 'https://kr.object.ncloudstorage.com/bit-project/profilepic/3.png', 'London, UK', 300, 'I love coding!', '199711', '987-654-3210', 0, 9),
('윤종광', 'jessica@example.com', sha2('1111',256), 2, 'https://kr.object.ncloudstorage.com/bit-project/profilepic/4.png', 'Sydney, Australia', 400, 'Hello, world!', '199509', '111-222-3333', 0, 9),
('josh', 'josh@example.com', sha2('1111',256), 1, 'https://kr.object.ncloudstorage.com/bit-project/profilepic/5.png', 'Paris, France', 500, 'Bonjour!', '199408', '222-333-4444', 0, 0),
('jack', 'jack@example.com', sha2('1111',256), 1, 'https://kr.object.ncloudstorage.com/bit-project/profilepic/6.png', 'Tokyo, Japan', 600, 'alloha!', '199312', '333-444-5555', 0, 0),
('jenny', 'jenny@example.com', sha2('1111',256), 2, 'https://kr.object.ncloudstorage.com/bit-project/profilepic/7.png', 'Berlin, Germany', 700, 'Hallo!', '199212', '444-555-6666', 0, 0),
('jason', 'jason@example.com', sha2('1111',256), 1, 'https://kr.object.ncloudstorage.com/bit-project/profilepic/8.png', 'Los Angeles, USA', 800, 'Hi, there!', '199112', '555-666-7777', 0, 0);


-- 게시글 insert
INSERT INTO aim_board (member_no, origin_content, summary_content, trans_content, tag, like_cnt, view_cnt, board_public, reply_public)
VALUES
(32, 'System', 'system', 'system', '#system', 0, 0, 0, 0),
(2, '요즘 일이 너무 많아서 정신없네요. 이번 주말엔 조금 쉬면서 책 좀 읽을 거 같아요.', 'Im so busy these days that I feel like Im losing my mind. I think Ill take a break and read a book this weekend.', '#일상 #쉬다 #독서', 124, 0, 1, 1),
(3, '나는 오늘 하루 일과를 마치고 노래를 들으며 휴식을 취했다. 그리고 내일도 이런 일정을 가지면 좋겠다.', 'I finished my work today and took a break listening to music. I hope I have this kind of schedule tomorrow too.', '#휴식 #음악 #일과', 77, 0, 1, 1),
(4, '나는 내일 가족들과 함께 여행을 갈 예정이다. 그래서 오늘은 짐을 챙기는 등 여행 준비를 하느라 바빴다. 하지만 내일이 기대된다!', 'Im planning to go on a trip with my family tomorrow. So today, I was busy preparing for the trip, such as packing. But Im looking forward to tomorrow!', '#여행 #가족 #준비', 521, 0, 1, 1),
(5, '오늘 하루도 즐겁게 보냈어요. 작업도 잘 마무리하고 좋은 카페에서 커피도 한 잔 마셨어요. 이제 집에 가서 쉬어야겠어요.', 'I had a good day today. I finished my work well and had a cup of coffee at a nice cafe. Now I should go home and take a rest.', '#일상 #카페 #커피', 153, 0, 1, 1),
(6, '나는 이번 주말에 할 일을 모두 끝냈다. 내일은 내가 좋아하는 영화를 보며 조용한 주말을 보낼 계획이다.', 'I finished all my tasks for this weekend. I plan to spend a quiet weekend watching my favorite movie tomorrow.', '#주말 #영화 #휴식', 5, 0, 1, 1),
(7, '안녕하세요. 이번주는 일주일 동안 너무 바빠서 정말 힘들었습니다. 그래도 지금은 조금 놀 수 있어서 기분이 좋네요!', 'Hello. I was so busy this week for a week and it was really tough. But now Im feeling good that I can take a little break!', '#일상 #힘들다 #쉬다', 241, 0, 1, 1),
(8, '요즘 일이 너무 많아서 정신없네요. 이번 주말엔 조금 쉬면서 책 좀 읽을 거 같아요.', 'Im so busy these days that I feel like Im losing my mind. I think Ill take a break and read a book this weekend.', '#일상 #쉬다 #독서', 213, 0, 1, 1),
(1, '나는 오늘 하루 일과를 마치고 노래를 들으며 휴식을 취했다. 그리고 내일도 이런 일정을 가지면 좋겠다.', 'I finished my work today and took a break listening to music. I hope I have this kind of schedule tomorrow too.', '#휴식 #음악 #일과', 1005, 0, 1, 1),
(2, '나는 내일 가족들과 함께 여행을 갈 예정이다. 그래서 오늘은 짐을 챙기는 등 여행 준비를 하느라 바빴다. 하지만 내일이 기대된다!', 'Im planning to go on a trip with my family tomorrow. So today, I was busy preparing for the trip, such as packing. But Im looking forward to tomorrow!', '#여행 #가족 #준비', 3, 0, 1, 1),
(3, '오늘 하루도 즐겁게 보냈어요. 작업도 잘 마무리하고 좋은 카페에서 커피도 한 잔 마셨어요. 이제 집에 가서 쉬어야겠어요.', 'I had a good day today. I finished my work well and had a cup of coffee at a nice cafe. Now I should go home and take a rest.', '#일상 #카페 #커피', 57, 0, 1, 1),
(4, '나는 이번 주말에 할 일을 모두 끝냈다. 내일은 내가 좋아하는 영화를 보며 조용한 주말을 보낼 계획이다.', 'I finished all my tasks for this weekend. I plan to spend a quiet weekend watching my favorite movie tomorrow.', '#주말 #영화 #휴식', 958, 0, 1, 1);

-- 이미지 insert
INSERT INTO aim_generated_img (img_filename, board_no) 
VALUES
('https://kr.object.ncloudstorage.com/bit-project/contentpic/1.png', 1), 
('https://kr.object.ncloudstorage.com/bit-project/contentpic/2.png', 2), 
('https://kr.object.ncloudstorage.com/bit-project/contentpic/3.png', 3), 
('https://kr.object.ncloudstorage.com/bit-project/contentpic/4.png', 4), 
('https://kr.object.ncloudstorage.com/bit-project/contentpic/5.png', 5), 
('https://kr.object.ncloudstorage.com/bit-project/contentpic/6.png', 6), 
('https://kr.object.ncloudstorage.com/bit-project/contentpic/7.png', 7), 
('https://kr.object.ncloudstorage.com/bit-project/contentpic/8.png', 8), 
('https://kr.object.ncloudstorage.com/bit-project/contentpic/9.png', 9), 
('https://kr.object.ncloudstorage.com/bit-project/contentpic/10.png', 10), 
('https://kr.object.ncloudstorage.com/bit-project/contentpic/11.png', 11), 
('https://kr.object.ncloudstorage.com/bit-project/contentpic/12.png', 12); 

-- 댓글 insert
INSERT INTO aim_reply (board_no, member_no, content)
VALUES
    (1, 5, '흥미로운 게시글이네요. 잘 봤습니다.'),
    (1, 6, '저도 같은 고민을 하고 있었는데 이 게시글을 보니까 많은 도움이 되었습니다.'),
    (1, 7, '질문을 남겼는데 답변이 없어서 좀 아쉬웠습니다.'),
    (2, 3, '제가 겪은 비슷한 상황에서는 이렇게 해결했는데 도움이 되실까요?'),
    (2, 7, '좋은 정보 감사합니다. 이제 구체적으로 해결방안을 찾을 수 있을 것 같아요.'),
    (2, 2, '이해하기 쉽게 설명해주셔서 감사합니다.'),
    (3, 5, '와 이거 어떻게 만들었나 싶을 정도로 멋있습니다.'),
    (3, 1, '생각보다 어렵지 않네요. 나도 한번 도전해봐야겠어요!'),
    (3, 8, '정말 좋은 아이디어네요. 이렇게 새로운 시도를 해보는 것도 좋은 경험이 될 것 같습니다.'),
    (4, 5, '와 이거 어떻게 만들었나 싶을 정도로 멋있습니다.'),
    (4, 6, '생각보다 어렵지 않네요. 나도 한번 도전해봐야겠어요!'),
    (4, 1, '정말 좋은 아이디어네요. 이렇게 새로운 시도를 해보는 것도 좋은 경험이 될 것 같습니다.'),
    (5, 5, '와 이거 어떻게 만들었나 싶을 정도로 멋있습니다.'),
    (5, 6, '생각보다 어렵지 않네요. 나도 한번 도전해봐야겠어요!'),
    (5, 8, '정말 좋은 아이디어네요. 이렇게 새로운 시도를 해보는 것도 좋은 경험이 될 것 같습니다.'),
    (6, 5, '와 이거 어떻게 만들었나 싶을 정도로 멋있습니다.'),
    (6, 6, '생각보다 어렵지 않네요. 나도 한번 도전해봐야겠어요!'),
    (6, 1, '정말 좋은 아이디어네요'),
    (7, 2, ' 이렇게 새로운 시도를 해보는 것도 좋은 경험이 될 것 같습니다.'),
    (8, 4, '정말 좋은 아이디어네좋은 경험이 될 것 같습니다.'),
    (8, 3, '정말 좋은 아은 경험이 될 것 같습니다.'),
    (9, 1, '정요. 이렇게 새로운 시도를 해보는 것도 좋은 경험이 될 것 같습니다.'),
    (9, 2, '정말 좋은 아이디어네요. 이은 경험이 될 것 같습니다.'),
    (9, 3, '정말 좋은 아이디어네요. 이렇게 경험이 될 것 같습니다.'),
    (9, 4, '정말 디어네요. 이렇게 새로운 시도는 것도 좋은 경험이 될 것 같습니다.'),
    (9, 1, '정말 디어네요. 이렇게 새로운 시도를 해보는 것도 좋은 경험이 될 것 같습니다.'),
    (10, 5, '정말 좋은 아이디어네요. 이렇게 시도를 해보는 것도 좋은 경험이 될 것 같습니다.'),
    (11, 6, '정말 좋은 아이디도를 해보는 것도 좋은 경험이 될 것 같습니다.'),
    (11, 7, '정말 좋은 아이디어네요. 이렇게  경험이 될 것 같습니다.'),
    (11, 1, '정말 좋은 아이 새로운 시도를 해보는 것도 좋은 경험이 될 것 같습니다.'),
    (12, 2, '정말 좋은 아이디어보는 것도 좋은 경험이 될 것 같습니다.'),
    (12, 8, '정말 좋은 아이디어네요. 이렇게 새로운 시도를 해보는  될 것 같습니다.');
    


-- FAQ유형 insert
INSERT INTO aim_faq_type (faq_type_no, faq_type)
VALUES
(1, 'Artify 기능 '),
(2, '계정관리'),
(3, '공개 범위 및 보안'),
(4, '정책 및 신고'),
(5, '지원 관리');


INSERT INTO aim_faq (faq_type_no, title, content)
VALUES
(1, '회원님의 프로필', '&emsp;- 프로필에는 회원님의 게시글 및 게시글관리, <strong>Artify</strong>설정이 있습니다.\n<br>&emsp;- 여기에서 회원님이 팔로우하는 사람과 회원님을 팔로우하는 사람 리스트를 확인할 수 있습니다.'),
(1, '게시글 작성', '&emsp;- <strong>Artify</strong>에서 게시글을 팔로워와 공유할 수 있습니다.\n<br>&emsp;1. 회원님의 프로필화면 및  오른쪽 상단의 프로필 사진을  클릭합니다.\n<br>&emsp;2. 글쓰기 버튼을 누른 후 글을 작성하고 확인 버튼을 누릅니다.\n<br>&emsp;3. <strong>Artify</strong>가 작성된 글을 읽고 회원의 글에 맞는 후보그림을 선택합니다.(최대 3분정도 소요)\n<br>&emsp;4. 맘에 드는 그림을 선택 후 확정을 누르시면 게시글의 작성이 완료되며  공유되기 시작합니다.'),
(1, '포인트 획득 및 사용', '&emsp;- 포인트는 회원가입 시 지급됩니다.\n<br>&emsp;- 글을 작성하여 올릴경우와 다른 회원의 글에 댓글을  작성 할 경우 포인트를 획득할 수 있습니다.'),
(2, '가입 및 시작', '<strong>Artify</strong>계정 만들기\n<br>&emsp;1. <strong>Artify.com</strong>으로 이동하고 오른쪽 상단의 <strong>Sign up</strong>을 클릭합니다.\n<br>&emsp;2. 계정이 없을 경우 신규가입 버튼을 클릭합니다.\n<br>&emsp;3. 이메일, 닉네임, 비밀번호 입력합니다.\n<br>&emsp;4. <strong>Sign up</strong>을 클릭합니다.\n<br>&emsp;5. 1~4의 과정을 진행하실 경우 가입이 완료 됩니다.<br><br><strong>Artify</strong>계정을 만드는데 문제가 발생한 경우\n<br>&emsp;- <strong>Artify</strong>계정을 만들 때 발생한 문제를 저희에게 알려주세요.<br><br>로그인에 문제가 생길 경우\n<br>&emsp;- 비밀번호에 문제가 있어 로그인이 안된다면 비밀번호를 재설정해야 합니다.\n<br>&emsp;- 비밀번호 오타 및 변경 후 로그인을 할 수 없다면 저희에게 알려주세요.'),
(2, '계정설정', '<strong>Artify</strong>계정 설정\n<br>&emsp;1. <strong>Artify</strong>계정 설정을 하려면 회원님의 계정에 로그인을 해야합니다.\n<br>&emsp;2. 홈페이지의 오른쪽 상단의 프로필을 클릭합니다.\n<br>&emsp;3. 설정 버튼을 클릭합니다.\n<br>&emsp;4. 설정 페이지로 이동 한 후 원하시는 탭으로 이동하여 변경이 가능합니다.'),
(2, '알림설정', '&emsp;- <strong>Artify</strong>에서 푸시 알림을 조정하고 싶다면 아래와 같이 진행해주세요.\n<br>&emsp;1. 홈페이지의 오른쪽 상단의 프로필을 클릭합니다.\n<br>&emsp;2. 설정 버튼을 클릭합니다.\n<br>&emsp;3. 설정 페이지로 이동 한 후 원하시는 탭으로 이동하여 변경이 가능합니다.'),
(3, '개인정보 설정 관리', '공개 범위 설정 및 공개 범위 확인\n<br>&emsp;- 언제든지 개인정보 설정을 조회하고 변경할 수 있습니다.\n<br>&emsp;1. 홈페이지의 오른쪽 상단의 프로필을 클릭합니다.\n<br>&emsp;2. 설정 버튼을 클릭합니다.\n<br>&emsp;3. 설정페이지로 이동 한 후 공개 설정 탭으로 이동하여 변경이 가능합니다.<br><br><strong>Artify</strong>에서 게시물을 공개할 때는 다음 사항에 주의해야 합니다.\n<br>&emsp;- <strong>Artify</strong>에 공유한 게시물 공개정보의 최초 설정 값은 전체공개입니다.\n<br>&emsp;- 게시물이 프로필, 검색 결과에 표시됩니다.\n<br>&emsp;- 특정 대상에게 게시물이 노출되고 싶지 않다면 공개 설정 및 차단을 해야 합니다.<br><br><strong>Artify</strong>에서 다른 사람을 차단하거나 차단 해제하기\n<br>&emsp;- <strong>Artify</strong>에서 여러가지 방법으로 다른 사람을 차단할 수 있습니다.\n<br>&emsp;  차단된 사람은 회원님이 차단했다는 알림을 받지 않습니다.\n<br>&emsp;- 차단을 해제하려면 설정탭으로 이동 후 차단탭에서 추가 및 해제가 가능합니다.\n<br>&emsp;- 차단된 사람의 리스트를 확인 하려면 위의 내용과 같이 이동하시면 됩니다.'),
(3, '로그인 및 비밀번호', '현재 비밀번호를 알고 있다면 변경이 가능합니다.<br><br>새 비밀번호를 만들 때 다음 사항에 유의하세요.\n<br>&emsp;- 비밀번호는 본인이 기억하기 쉽지만 다른 사람들이 추측하기 어려워야 합니다.\n<br>&emsp;- 보통 길고 복잡 할수록 안전합니다.\n<br>&emsp;- 회원님의 기본정보를 비밀번호 할 경우 보안에 취약합니다.<br><br><strong>Artify</strong> 로그인 정보를 사용하여 로그인하기\n<br>&emsp;1. <strong>Artify.com</strong>으로 이동합니다.\n<br>&emsp;2. 홈 화면에서 오른쪽 상단의 로그인 버튼을 클릭합니다.\n<br>&emsp;3. 이메일과 비밀번호를 입력하고 로그인을 합니다.'),
(4, '신고하기', '악용 사례 신고하기\n<br>&emsp;- <strong>Artify</strong>에 신고가 접수되면 검토 후 규정을 위반하는 콘텐츠가 삭제됩니다.\n<br>&emsp;   신고접수된 내용은 규정을 위반할 가능성이 있는 다른 신고된 콘텐츠를 검토하는 시스템을 개선하기 위해 사용될 수도 있습니다.\n<br>&emsp;   <strong>Artify</strong>에서 신고된 사람에게 연락할 때는 신고자에 관한 정보를 알리지 않습니다.\n<br>&emsp;   하지만 <strong>Artify</strong>에 신고한다고 해서 해당 콘텐츠가 삭제된다는 보장은 없습니다.\n<br>&emsp;1. 게시물의 화면에서 신고하기 버튼을 클릭합니다.\n<br>&emsp;2. 해당 유형을 선택하시고 다음을 누릅니다.\n<br>&emsp;3. 신고내용을 작성하시며, 선택에 따라 첨부 이미지를 추가하시면 됩니다.\n<br>&emsp;    (단, 신고내용이 상세 할수록 관리자가 판단하기가 용이합니다.');

INSERT INTO aim_report (report_type)
VALUES
('음란물'),
('스팸'),
('혐오물'),
('폭력물'),
('불법행위'),
('지식 재산권 침해'),
('자살 또는 자해'),
('기타');

-- aim_board 에 summary_content 추가 후 데이터 넣기
UPDATE aim_board SET summary_content = '요약 내용입니다.';

-- 알림 타입 추가
INSERT INTO aim_alarm_type (alarm_type) VALUES('reply'),('like_board'),('like_reply'),('follower');

-- 회원 알림 설정 추가
INSERT INTO aim_alarm (member_no, type) VALUES(4, 1),(4, 2),(4, 3), (4, 4);

-- 알림 로그 추가
INSERT INTO aim_alarm_log (type_no, member_no, other_no, content) 
VALUES
(1, 4, 1, '내용1'),
(2, 4, 3, '내용2'),
(3, 4, 5, '내용3'),
(4, 4, 2, '내용4');

