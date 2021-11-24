<%@ page language="java" contentType="html; charset=UTF-8"
         pageEncoding="UTF-8" %>
         
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HTML 레이아웃(layout)</title>
   
<!-- 

	1. 제가 css대신 그냥 스타일로 때려 넣었습니다..죄송합니다..능력+시간 되는데로 파일로 빼보도록 하겠습니다.
	2. 파일 경로는 WEB-IN > kosmos > 에 넣으려고 했으나, kosmos 하위 위치에 있으면 안보일 거에요. 일단 WebContent에 둘게요. 필요에 따라 이동시키세요.
	3. 사진을 읽어들이지 못합니다. 사진은 WebContent > img > 내에 있습니다. 계속 업데이트 하겠습니다.

-->


<!-- 스타일 시작  -->

    <style>	
	@import url('https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap');


        /*노말라이즈*/
        @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
		@import url(https://fonts.googleapis.com/css?family=Roboto);
		
		@import "utf-8";
		
		body,h1,h2,h3,h4,h5,h6,ul,li,ol,dd,dt,dl,p,button,div,hr{margin:0;padding:0;list-style:none;font-family:Nanum Gothic;font-family:font-family: Roboto, sans-serif;}
		img,button{border:0;}
		button{background:0;}
		a{text-decoration:none;color: inherit;}


        /*커스텀*/

		.wrap{width:1200px;margin:0 auto;}
		/*
		.wrap{width:1200px;margin:0 auto;border:1px solid #a9a9a9;box-shadow:1px 10px 15px 5px #a9a9a9;}
		*/

        /*상단메뉴바 여백*/
        .menu-bar {
            margin: 10px 0px 0px 0px;
        }

        /*1차 메뉴 중앙 정렬*/
        .menu-bar .menu-box-1 {
            -align: left;
            
        }

        /*메뉴 아이템 배경색*/
        .menu-bar .menu-box-1 ul {
            background-color: #dfdfdf;
        }

        /*1차 메뉴박스*/
        .menu-bar .menu-box-1 > ul {
        
            display: inline-block;
            /* 메뉴 길이 */
            border-radius: 10px;
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            /* 여기까지 */
            width: 100%;
            -align: center;
        }

        /*1차 메뉴아이템*/
        .menu-bar .menu-box-1 > ul > li {
            display: inline-block;
            width: 12%;
        }

        /*메뉴 아이템 포지션 정리*/
        .menu-bar .menu-box-1 ul > li {
            position: relative;
        }

        /*메뉴 텍스트*/
        .menu-bar .menu-box-1 ul > li > a {
            display: block;
            padding: 20px;
        }

        .menu-bar .menu-box-1 ul > li:hover > a {
            background-color: #B5AC7E;
            border-radius: 10px;
            color: black;
        }

        /*2차 메뉴박스*/
        .menu-bar .menu-box-1 ul ul {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            width: 100%;
        }

        .menu-bar .menu-box-1 ul > li:hover > ul {
            display: block;
        }

        /*3차 메뉴박스 정렬*/
        .menu-bar .menu-box-1 ul ul ul {
            top: 0;
            left: 100%;
        }

        /*1차 마지막아이템의 3차메뉴박스 왼쪽으로 정렬*/
        .menu-bar .menu-box-1 > ul > li:last-child > ul ul {
            left: auto;
            right: 100%;
        }

        /*컨텐츠 박스*/
        .content-box {
            width: 100%;
            
            -align: left;
           
        }

        .content-top {
            -align: left;
            width: 100%;
            height: 50px;
            
            padding-top: 30px;
        }


        /*사이드 메뉴 바*/
        .left-side-bar {
        	
            position: fixed;
            top: 0;
            left: -230px;
            width: 260px;
            height: 100%;
            background-color: #dfdfdf;
            transition: left 1s;
        }

        .left-side-bar:hover {
            left: 0;
            transition: left 1s;
        }

        /*화살표*/
        .left-side-bar > .icon-status {
            display: block;
            -align: right;
            padding-right: 5px;
            font-size: 20px;
        }

        .left-side-bar > .icon-status > span:first-child {
            display: inline-block;
        }

        .left-side-bar:hover > .icon-status > span:first-child {
            display: none;
        }

        .left-side-bar > .icon-status > span:last-child {
            display: none;
        }

        .left-side-bar:hover > .icon-status > span:last-child {
            display: inline-block;
        }

        /* 모든 사이드 메뉴박스 배경색*/
        .left-side-bar .left-side-box ul {
            background-color: #dfdfdf;
        }

        /*사이드 메뉴아이템 포지션*/
        .left-side-bar .left-side-box ul > li {
            position: relative;
        }

        /*사이드 메뉴텍스트*/
        .left-side-bar .left-side-box ul > li > a {
            display: block;
            padding: 20px;
            white-space: nowrap;
        }

        .left-side-bar .left-side-box ul > li:hover > a {
            background-color: #B5AC7E;
            color: black;
        }

        /*2차이하 사이드메뉴 박스*/
        .left-side-bar .left-side-box ul ul {
            display: none;
            position: absolute;
            top: 0;
            left: 100%;
        }

        /*2차이하 사이드메뉴 박스 최소사이즈*/
        .left-side-bar .left-side-box ul > li:hover > ul {
            display: block;
        }

        /*사이드 메뉴아이템 하위 표시*/
        .left-side-bar .left-side-box ul > li > a:not(:only-child)::after {
            content: "[+]"
        }

        .left-side-bar .left-side-box ul > li:hover > a:not(:only-child)::after {
            content: "[-]"
        }

        /* 이미지 오버레이 */
        .image {
            position: relative;
            
        }
		/*
        .image .text {
            position: absolute;
            bottom: 30px;
            left: 80px;
        }
        */
        .container{
        	width:1200px;
        	margin:0 auto;margin-top:30px;
        }

		.menu-box-1{
		
		}
		
		.image{
			background:url(/springHbe/img/kosmos_1.jpg);no-repeat;height:500px; background-position: center center;
		}
		
/* 
	위에 사진경로 이상함 (사진은 img 파일 안에 첨부되어 있음)

	/springHbe/img/kosmos_1.jpg  
	/KOSMOS/WebContent/img/kosmos_1.jpg

*/
		
		
		.text{width:1200px;margin:0 auto;padding-top:410px;}
		
		.menu-box-1>ul{margin:0 auto;text-align:center;}
		
		.menu-bar{width:1200px;margin:0 auto;position:absolute;top:470px;}
		
    </style>

<!-- 스타일 끝 -->




</head>
<body>

<!--
	* 여백 메모용
	<div style="padding:60px;"> 
	순서대로 시계방향 위 오른쪽 아래 왼쪽 
-->

<!--------- 이미지 위에 글씨 오버랩 하는 부분 --------->
<div class="image">
    <!-- <img src="/springHbe/img/kosmos.PNG" width="100%"> -->
    <div class="text">
        <h1>KOSMOS 고등학교</h1>
    </div>
</div>

<!-----------------상단메뉴 바----------------->
<div class="wrap">
<div class="menu-bar">
    <nav class="menu-box-1">
        <ul>
            <li>
                <a href="#">홈</a>
            </li>
            <li>
                <a href="#">학교소개</a>
                <ul>
                    <!---
                    <li><a href="#">3차메뉴아이템1</a></li>
                    <li><a href="#">3차메뉴아이템2</a></li>
                    <li><a href="#">3차메뉴아이템3</a></li>
                    <li><a href="#">3차메뉴아이템4</a></li>
                      --->
                    <li>
                        <a href="#">학교연혁</a>
                    </li>
                    <li>
                        <a href="#">학교상징</a>
                    </li>
                    
                    <!--- 메뉴 아이템추가 예시용 ----->
                    <!--
                      <li>
                      <a href="#">주소약도</a>
                    </li>
                    -->
                    
                </ul>
            </li>
            <li>
                <a href="#">수강신청</a>
                <ul>
                </ul>
            </li>
            <li>
                <a href="#">수업정보</a>
                <ul>
                    <li>
                        <a href="#">과목정보</a>
                    </li>
                    <li>
                        <a href="#">시간표</a>
                    </li>
                </ul>
            <li>
                <a href="#">게시판</a>
                <ul>
                    <li>
                        <a href="#">공지사항</a>
                    </li>
                    <li>
                        <a href="#">코스모스숲</a>
                    </li>
                </ul>
            <li>
                <a href="#">자료실</a>
                <ul>
                    <li>
                        <a href="#">일반자료실</a>
                    </li>
                    <li>
                        <a href="#">수업자료실</a>
                    </li>
                </ul>
            <li>
                <a href="#">주소약도</a>
            </li>
        </ul>
    </nav>
</div>

<!-- 컨텐츠 내용 분리한 부분 제목등 들어갈 수 있을듯 -->
<div class="container">
<div class="content-top">
    컨텐츠 박스 위 공간1
</div>

<!-- 주요내용 들어가는 부분 입니다. div로 한번 더 감싸야할 수도 있어요-->

<div class="content-box">
    Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis aut ab nam accusantium quas
    laboriosam sequi delectus nulla excepturi, consequatur, vero, hic adipisci? Totam impedit autem, ad neque
    voluptas
    consectetur?
    Reiciendis eius facere hic fugit dolor eum eos minus quidem minima possimus harum blanditiis iure, maiores
    dolorem
    aspernatur iste porro facilis consectetur? Dolore error quae eum ratione, provident perferendis iusto?
    Tempore aut neque repudiandae vitae soluta minus et incidunt repellendus fuga magni. Cumque officiis nobis
    doloremque eum corporis, unde ullam omnis, labore, repellat eaque quaerat nulla nostrum placeat. Perspiciatis,
    sed.
    Voluptate ut itaque sunt quos, ad eius debitis error aliquid at similique eum veritatis cum dolorum? Inventore
    quibusdam nostrum ipsa deserunt molestiae. Nemo veritatis quae dolores sapiente quis, nihil sit?
    Totam, minus eos ut labore nam facilis inventore vero placeat consequuntur, cum blanditiis cumque et hic!
    Maiores
    facere ipsa sunt facilis vitae blanditiis eveniet! Veniam repellat excepturi nesciunt nemo numquam.
    Dolores illo dicta similique numquam maxime quaerat cum corporis molestias debitis. Praesentium obcaecati quidem
    assumenda enim. Fugiat nam veritatis iste quidem ullam dignissimos consequuntur nihil, accusantium expedita
    voluptas
    cum at.
    Nam ullam libero obcaecati ipsa, eaque expedita aliquid. Reprehenderit repellendus placeat quod ea reiciendis
    nam
    dignissimos accusamus et repudiandae, quo corporis! Fuga doloribus corrupti vero magni praesentium explicabo
    officia
    rerum!
    Placeat mollitia reiciendis et at optio. Sit veniam nemo explicabo nihil, maxime, totam aliquid voluptatum quae
    fugiat enim libero possimus reiciendis officiis vitae? Deserunt, error. Nisi error aperiam corporis commodi.
    Minima fugiat veritatis minus est. Impedit, modi esse. Nesciunt quaerat aliquam quis impedit, fugiat veritatis
    asperiores porro ullam. Quisquam repudiandae tempora vero doloremque inventore atque assumenda eos placeat saepe
    pariatur.
    Deserunt libero facere maxime, voluptates magni, laborum facilis vero recusandae atque harum illo quaerat
    reprehenderit repellat quas aperiam sequi sapiente. Sit excepturi molestiae dolore, illum fuga blanditiis
    voluptate
    saepe. Corporis?
    Quos aspernatur sit eos deleniti, omnis quasi libero, possimus eius voluptatem deserunt cum voluptas quo? Labore
    provident fugit iste libero illum optio dolorem aspernatur, excepturi minus id magni. Recusandae, dignissimos?
    Voluptas molestiae rerum alias labore, veniam quam incidunt distinctio commodi reprehenderit porro, autem
    corporis
    eaque molestias a aspernatur illum cupiditate aperiam culpa quod quae sequi! Ullam alias officia iure. Tempora?
    Iste rem quidem atque numquam, nesciunt suscipit quaerat illum quas quasi nisi dolor? Doloremque, nostrum sequi
    aspernatur itaque accusantium, natus tempora doloribus culpa quas labore ad quos quod ipsum minus.
    Vel reiciendis sit quae, placeat nemo expedita autem magnam. Cumque nesciunt temporibus exercitationem molestiae
    odio tempora maxime quis tenetur? Quae distinctio minima corrupti sed aut tenetur quasi libero possimus
    veritatis.
    Et unde, minus recusandae hic accusantium mollitia deserunt aspernatur quisquam neque, molestias voluptatibus
    accusamus aperiam ex? Tempora nihil in beatae, neque ipsa placeat eos blanditiis totam est sunt unde distinctio.
    Perferendis ipsam cumque asperiores nam enim officia qui modi recusandae dicta sint, tempora molestias sapiente!
    Quia, dignissimos cum laborum, atque adipisci error facere quas accusantium minima eaque natus doloribus eum.
    Obcaecati repellat facere mollitia! Nesciunt molestiae odio vero fuga similique veritatis assumenda
    perspiciatis,
    enim corrupti odit sunt quia nisi iste, dignissimos reiciendis ipsum, tempora reprehenderit repudiandae nihil
    ratione ut amet?
    Dolorum alias amet, maiores dignissimos officia pariatur ipsum velit similique delectus eveniet ducimus facilis!
    Asperiores qui ea obcaecati nisi quibusdam corrupti, libero blanditiis facere, voluptatum reprehenderit porro
    dicta,
    magni recusandae?
    Explicabo nobis odio earum error laudantium molestiae debitis quibusdam, fugiat, omnis libero qui? Iusto eos
    harum
    incidunt, ipsa, atque praesentium pariatur quia fuga doloremque tempore voluptatem et culpa quis! Voluptas.
    Qui amet praesentium incidunt veniam culpa eaque, eveniet sed dolores, rem voluptatibus deserunt nam vero odio
    laudantium libero est fugiat similique, dolore ullam nesciunt non. Laboriosam veritatis odit vel neque?
    Provident, velit et dolor nostrum quo minus unde ad, laudantium eum fugiat reiciendis, ex quos aperiam excepturi
    asperiores quibusdam sequi facere repudiandae. Excepturi dignissimos vitae sequi nobis, rem perspiciatis fugit.
    Exercitationem minus repellendus quos recusandae! Dolorum dicta mollitia cumque fugiat ullam sequi totam
    doloremque
    obcaecati laboriosam dolores. Temporibus nulla modi, vel doloribus consequuntur asperiores quam ipsa, quo ut
    excepturi necessitatibus!
    Consequuntur unde aliquid non voluptatem perferendis! Magnam, maxime voluptatibus! Nihil, dolorem sit iste illum
    exercitationem minus nostrum alias provident rem omnis autem, libero reprehenderit iure distinctio asperiores
    obcaecati eligendi recusandae!
    Doloremque aliquam pariatur neque quaerat inventore? Distinctio illo ad, rem ullam in illum quisquam asperiores
    facere architecto nulla veniam. Ad eveniet qui maxime optio, beatae quam illo nihil ullam cum?
    Eligendi quae, soluta impedit, dolorem sit praesentium mollitia fuga repellendus autem nulla saepe totam.
    Debitis
    dolor autem laborum dicta sapiente molestias necessitatibus consequatur excepturi, voluptatibus minus dolores
    aspernatur veniam placeat.
    Soluta, tempore nemo perspiciatis neque libero adipisci laborum atque vero molestiae rem modi corporis,
    doloribus a
    quis nulla culpa ipsum. Eaque iusto earum numquam, eius assumenda illo? Magni, inventore. Vel?
    Enim minus voluptas ut quos eius quasi dicta amet, doloremque officia necessitatibus modi quo beatae adipisci
    repellendus optio delectus officiis cupiditate iusto praesentium blanditiis dignissimos nesciunt laborum
    aperiam!
    Corrupti, deserunt?
    Adipisci quis suscipit ab dolor ipsa vitae molestiae laboriosam temporibus cupiditate veritatis cumque, quam
    commodi
    dolorum quas unde! Animi aut placeat aperiam? Nihil sequi unde odit eius voluptates dolore commodi?
    Officia sit laboriosam fugiat voluptas alias aspernatur culpa possimus eos voluptatem dolorem, omnis velit, cum
    tempora aliquam a laborum aut magni voluptate eveniet repellendus est. Nulla necessitatibus ea praesentium
    reiciendis!
    Quibusdam fugit omnis, animi ea provident veritatis quasi dignissimos, quam dicta adipisci consequatur
    voluptatem
    consectetur at ratione fugiat eligendi. Nobis, sunt officiis facilis veniam ullam non ad consectetur maiores
    doloremque.
</div>
</div>

<!---------사이드 메뉴 바---------->

<div class="left-side-bar">
    <div class="icon-status">
        <span>▶</span>
        <span>▼</span>
    </div>
    <nav class="left-side-box">
        <ul>
            <li>
                <a href="#">로그인</a>
            </li>
            <li>
                <a href="#">마이페이지</a>
                <ul>
                    <li>
                        <a href="#">학생정보</a>
                    </li>
                    <li>
                        <a href="#">시간표</a>
                    </li>
                    <li>
                        <a href="#">성적표</a>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>
</div>
</div>
</body>
</html>