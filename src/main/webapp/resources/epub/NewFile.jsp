<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/popup.css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 뷰어 -->
 <script src="libs/zip.min.js"></script>
 


<style>
.modal-dialog.modal-fullsize {
 width: 100%;
 height: 100%;
 margin: 0;
 padding: 0;
  }
.modal-content.modal-fullsize {
  height: auto;
  min-height: 100%;
  border-radius: 0; 
}
</style>
</head>
<body>
<!-- Modal windows button open -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModalinModal" data-title="Test Title">
  Open Modal
</button>
 
<!-- Modal window -->
<div class="modal fade" id="myModalinModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-fullsize">
    <div class="modal-content modal-fullsize">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" id="myModalLabel">뷰어</h4>
      </div>
      <div class="modal-body">
		hf
      </div>
    </div>
  </div>
</div>
 
<!-- Modal window option script -->
<script>
$('#myModalinModal').on('show.bs.modal', function (event) { // myModal 윈도우가 오픈할때 아래의 옵션을 적용
  var button = $(event.relatedTarget) // 모달 윈도우를 오픈하는 버튼
  var titleTxt = button.data('title') // 버튼에서 data-title 값을 titleTxt 변수에 저장
  var modal = $(this)
  modal.find('.modal-title').text('Title : viewer' ) // 모달위도우에서 .modal-title을 찾아 titleTxt 값을 치환
})
</script>

</body>
</html>