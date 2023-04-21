<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>넣은 음원의 추가적인 정보 등록</title>
<!-- Add Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Your custom CSS (if any) -->
<link rel="stylesheet" href="css/upload1.css">
</head>

<body>

	<div class="container text-center">
		<hr class="w-50">
		<h3>업로드 파일 폼 페이지</h3>
		<hr class="w-50">
		<br>
	</div>

	<form action="<%=request.getContextPath()%>/user_file.do" method="post"
		enctype="multipart/form-data">
		<c:set value="${sessionUserVO }" var="vo" />
		<input type="hidden" value="${vo.getUser_id() }">
		<div class="wrapper">
			<div class="content">
				<h3>Insert Music File</h3>
				<div class="file">
					<table class="table">
						<tr>
							<td>음원 파일</td>
							<td><label for="file">음원 파일</label> <input id="file"
								type="file" class="form-control-file" name="music_mp3"></td>
						</tr>

						<tr>
							<td>앨범 이름</td>
							<td><input type="text" name="music_id" class="form-control">
							</td>
						</tr>

						<tr>
							<td>앨범 사진</td>
							<td><label for="music_pic">앨범사진</label> <input
								id="music_pic" type="file" class="form-control-file"
								name="music_pic"></td>
						</tr>

						<tr>
							<td>음원 제목</td>
							<td><input type="text" name="music_title"
								class="form-control"></td>
						</tr>

						<tr>
							<td>음원 장르</td>
							<td><select name="genre">
									<option value="classic">클래식</option>
									<option value="jazz">재즈</option>
									<option value="ccm">CCM</option>
									<option value="pop">POP</option>
									<option value="ballad">발라드</option>
									<option value="blues">블루스</option>
									<option value="rand_d">(R&D)</option>
									<option value="hip_hop">힙합</option>
									<option value="country">컨트리뮤직</option>
									<option value="folk">포크뮤직</option>
									<option value="reggae">레게</option>
									<option value="disco">디스코</option>
									<option value="writer">ROOK</option>
									<option value="electronic">전자음악</option>
									<option value="trot">트로트</option>
									<option value="dance">댄스음악</option>
							</select></td>
						</tr>

						<tr>
							<td>음원 설명</td>
							<td><textarea rows="7" cols="25" name="music_contents"
									class="form-control"></textarea></td>
						</tr>

						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="음원 등록" class="btn btn-primary"></td>
						</tr>
					</table>
				</div>

			</div>
		</div>

	</form>

	<!-- Add Bootstrap and jQuery scripts -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>