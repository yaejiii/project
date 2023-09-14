<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../mall_client/mall_index_top.jsp" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>sns-insert</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/sns_insert.css">
<script type="text/javascript">
		function check(){
			if(f.file_img0.value==""){
						alert("이미지를 등록해주세요.")
						f.file_img0.focus()
						return false
			}
			if(f.content.value==""){
				alert("내용을입력해주세요.")
				f.content.focus()
				return false
			}
			return true
		}
		
</script>

</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous">
	</script>
	<script type="text/javascript" src="resources/js/sns_insert.js?ver=1"></script>

	<form name="f" action="insert_sns.do" onsubmit="return check()"
		method="post" enctype="multipart/form-data">

		<div class="container">
			<div class="row">
				<div class="col-12">새 게시물 만들기</div>
				<div class="col-8" style="padding: 10px">								
	
				<div class="col-4" style="padding: 10px">
					<div class="card"
						style="width: 100%; height: 100%; border-radius: 0">
						<div class="card-body">
							<h5 class="card-title" _msttexthash="21830458" _msthash="227">
								<div
									style="overflow: hidden; border-radius: 70%; width: 35px; height: 35px; float: left; margin: 5px">
									<img
										src="https://search.pstatic.net/common/?src=https%3A%2F%2Fditto-phinf.pstatic.net%2F20230530_136%2F1685430920231bDDTC_JPEG%2Fc2f73ab8e099dee54cd2c9a9af6946b3.jpeg&type=o&size=488x470&ttype=input"
										width="35px" height="35px">
								</div>
				
							</h5>
							<div class="card-text" _msttexthash="651090466" _msthash="229">
								<textarea placeholder="문구 입력..." class="border-0" rows="10"
									style="width: 100%;" name="content" id="content"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div id="attachFileDiv">
                  <div id="file0">
               <input type="file" id="file_img0" name="file_img0" value="" size="20"
                     onchange="javascript:attachFile.add(0)" >
               </div>      
           		</div>
					<div id="image-preview" class="image-preview"></div>
				</div>
				<div class="col-1" style="align: left; margin-left: 20;">
			
            </svg>

					</a>
				</div>

				<div class="col-4 d-grid gap-0">
					<button type="submit" class="btn btn-dark" style="border-radius: 0">
						업로드</button>
				</div>

				<div class="col-8">
					<div
						style="overflow: hidden; border-radius: 20%; width: 120px; height: 120px; float: left; margin: 5px">
						<img src="">
					</div>
				</div>

			</div>
		</div>

	</form>
</body>
</html>
