
var ebook_no="1";
var member_no="1";
var borrow_no="7";

String.prototype.trim = function() {
    return this.replace(/(^\s*)|(\s*$)/gi, "");
}

var cobookAddBookmark = function(chapter , cfi ) {

	
	var userInput = "THIS IS BOOKMARK USER"; 
	var result = false;
	var resultMsg = '';
	var resultMap = new Map();
	
	console.log("start");
	$.ajax({
		  type  : "GET", //요청 메소드 타입
		  url   : "/cobook/ebook/writeBookMark", //요청 경로
		  async : false, //비동기 여부
		  data  : {	"member_no"  :  member_no,				//요청 시 포함되어질 데이터
			  		"ebook_no" 	 :	ebook_no,		
			  		"ebookPage"	 :  cfi, 	//cfi
			  		"chapter" 	 :  chapter,
			  		"mybookmark" :  userInput	//user input 값		
		  		},
		//  processData : true, 					//데이터를 컨텐트 타입에 맞게 변환 여부
		  cache : true, 						//캐시 여부
		  contentType : "application/json", 	//요청 컨텐트 타입 "application/x-www-form-urlencoded; charset=UTF-8"
		  dataType  : "json",				 	//응답 데이터 형식 명시하지 않을 경우 자동으로 추측
		  beforeSend  : function(){
			  console.log("go");
		    // XHR Header를 포함해서 HTTP Request를 하기전에 호출됩니다.
		  },
		  success   : function(data, status, xhr){console.log("success");
			  console.log('#success');
			  console.log(data);
			  console.log(status);
			  console.log(xhr);
		    // 정상적으로 응답 받았을 경우에는 success 콜백이 호출되게 됩니다.
		    // 이 콜백 함수의 파라미터에서는 응답 바디, 응답 코드 그리고 XHR 헤더를 확인할 수 있습니다.
			  result = true;
			  resultMap.set('result',result);
			  resultMap.set('resultMsg',resultMsg);
			  resultMap.set('userInput',userInput);

			  
		  },
		  error : function(xhr, status, error){
			  console.log('#error');
			  console.log(error);
			  console.log(status);
			  console.log(xhr);
		    // 응답을 받지 못하였다거나 정상적인 응답이지만 데이터 형식을 확인할 수 없기 때문에 error 콜백이 호출될 수 있습니다.
		    // 예를 들어, dataType을 지정해서 응답 받을 데이터 형식을 지정하였지만, 서버에서는 다른 데이터형식으로 응답하면  error 콜백이 호출되게 됩니다.
				 
			  result = false;
			  resultMsg = error;
			  resultMap.set('result',result);
			  resultMap.set('resultMsg',resultMsg);
			  resultMap.set('userInput',userInput);
		  },
		  complete : function(xhr, status){	console.log("complete");
		    // success와 error 콜백이 호출된 후에 반드시 호출됩니다.
		    // try - catch - finally의 finally 구문과 동일합니다.
				
				console.log("this is cobook addBookmark");
				console.log('result : '+ result);
				console.log('resultMsg : '+ resultMsg);
				console.log('chapter : '+chapter);
				console.log('userInput : '+userInput);
				console.log('cfi : '+cfi);
				console.log('ebook_no : '+ebook_no);
				console.log('member_no : '+member_no);
				
		  }
		});
	
	
	console.log("fin");
	return resultMap;
	
	
}

/**
 * 북마크 제거 
 * 
 */
var cobookRemoveBookmark = function( cfi ) {
	console.log("OK! removeBookmark");

	var result = false;
	var resultMsg = '';
	
	$.ajax({
		  type  : "GET", //요청 메소드 타입
		  url   : "/cobook/ebook/deleteBookmark", //요청 경로
		  async : false, //비동기 여부
		  data  : {	"member_no"  :  member_no,				//요청 시 포함되어질 데이터
			  		"ebook_no" 	 :	ebook_no,		
			  		"ebookPage"	 :  cfi	
		  		},
		//  processData : true, 					//데이터를 컨텐트 타입에 맞게 변환 여부
		  cache : true, 						//캐시 여부
		  contentType : "application/json", 	//요청 컨텐트 타입 "application/x-www-form-urlencoded; charset=UTF-8"
		  dataType  : "json",				 	//응답 데이터 형식 명시하지 않을 경우 자동으로 추측
		  beforeSend  : function(){
		    // XHR Header를 포함해서 HTTP Request를 하기전에 호출됩니다.
		  },
		  success   : function(data, status, xhr){
		    // 정상적으로 응답 받았을 경우에는 success 콜백이 호출되게 됩니다.
		    // 이 콜백 함수의 파라미터에서는 응답 바디, 응답 코드 그리고 XHR 헤더를 확인할 수 있습니다.
			  result = true;
			  console.log('#success');
			  console.log(data);
			  console.log(status);
			  console.log(xhr);
			  
		  },
		  error : function(xhr, status, error){
		    // 응답을 받지 못하였다거나 정상적인 응답이지만 데이터 형식을 확인할 수 없기 때문에 error 콜백이 호출될 수 있습니다.
		    // 예를 들어, dataType을 지정해서 응답 받을 데이터 형식을 지정하였지만, 서버에서는 다른 데이터형식으로 응답하면  error 콜백이 호출되게 됩니다.
		 
			  result = false;
			  resultMsg = error;
			  
			  console.log('#error');
			  console.log(error);
			  console.log(status);
			  console.log(xhr);
		  },
		  complete : function(xhr, status){
		    // success와 error 콜백이 호출된 후에 반드시 호출됩니다.
		    // try - catch - finally의 finally 구문과 동일합니다.
		  }
		});
	var resultMap = new Map();
	resultMap.set('result',result);
	resultMap.set('resultMsg',resultMsg);
	
	console.log("this is cobook remove");
	console.log('result : '+ result);
	console.log('resultMsg : '+ resultMsg);
	console.log('cfi : '+cfi);
	console.log('ebook_no : '+ebook_no);
	console.log('member_no : '+member_no);
	
	return resultMap;
}

var updateLastPage = function( cfi ) {
	console.log("OK! updateLastPage"+ cfi+"  ..  "+borrow_no );

	var result = false;
	var resultMsg = '';
	
	$.ajax({
		  type  : "GET", //요청 메소드 타입
		  url   : "/cobook/ebook/setLastPage", //요청 경로
		  async : true, //비동기 여부
		  data  : {	
			        //"member_no"  :  member_no,				//요청 시 포함되어질 데이터
			        //"ebook_no" 	 :	ebook_no,		
			        "borrow_no" 	 :	borrow_no,		
			  		"readPage"	 :  cfi	
		  		},
		// processData : true, 					//데이터를 컨텐트 타입에 맞게 변환 여부
		  cache : true, 						//캐시 여부
		  contentType : "application/json", 	//요청 컨텐트 타입 "application/x-www-form-urlencoded; charset=UTF-8"
		  dataType  : "json",				 	//응답 데이터 형식 명시하지 않을 경우 자동으로 추측
		  beforeSend  : function(){
		    // XHR Header를 포함해서 HTTP Requ	est를 하기전에 호출됩니다.
		  },
		  success   : function(data, status, xhr){
		    // 정상적으로 응답 받았을 경우에는 success 콜백이 호출되게 됩니다.
		    // 이 콜백 함수의 파라미터에서는 응답 바디, 응답 코드 그리고 XHR 헤더를 확인할 수 있습니다.
			  result = true;
			  console.log('#success');
			  console.log(data);
			  console.log(status);
			  console.log(xhr);
			  
		  },
		  error : function(xhr, status, error){
		    // 응답을 받지 못하였다거나 정상적인 응답이지만 데이터 형식을 확인할 수 없기 때문에 error 콜백이 호출될 수 있습니다.
		    // 예를 들어, dataType을 지정해서 응답 받을 데이터 형식을 지정하였지만, 서버에서는 다른 데이터형식으로 응답하면  error 콜백이 호출되게 됩니다.
		 
			  result = false;
			  resultMsg = error;
			  
			  console.log('#error');
			  console.log(error);
			  console.log(status);
			  console.log(xhr);
		  },
		  complete : function(xhr, status){
		    // success와 error 콜백이 호출된 후에 반드시 호출됩니다.
		    // try - catch - finally의 finally 구문과 동일합니다.				
				console.log("this is cobook updateLastPage");
				console.log('result : '+ result);
				console.log('resultMsg : '+ resultMsg);
				console.log('cfi : '+cfi);
				console.log('ebook_no : '+ebook_no);
				console.log('member_no : '+member_no);
				
		  }
		});

}


var cobookGetBookmarkList = function() {
	var result = false;
	var resultMsg = '';
	
	$.ajax({
		  type  : "GET", //요청 메소드 타입
		  url   : "/cobook/ebook/getBookmarkList", //요청 경로
		  async : true, //비동기 여부
		  data  : {	
			        "member_no"  :  member_no,				//요청 시 포함되어질 데이터
			        "ebook_no" 	 :	ebook_no	
			  		},
		// processData : true, 					//데이터를 컨텐트 타입에 맞게 변환 여부
		  cache : true, 						//캐시 여부
		  contentType : "application/json", 	//요청 컨텐트 타입 "application/x-www-form-urlencoded; charset=UTF-8"
		  dataType  : "json",				 	//응답 데이터 형식 명시하지 않을 경우 자동으로 추측
		  beforeSend  : function(){
		    // XHR Header를 포함해서 HTTP Requ	est를 하기전에 호출됩니다.
		  },
		  success   : function(data, status, xhr){
		    // 정상적으로 응답 받았을 경우에는 success 콜백이 호출되게 됩니다.
		    // 이 콜백 함수의 파라미터에서는 응답 바디, 응답 코드 그리고 XHR 헤더를 확인할 수 있습니다.
			  result = true;
			  console.log('#success');
			  console.log(data);
			  console.log(status);
			  console.log(xhr);
			  
		  },
		  error : function(xhr, status, error){
		    // 응답을 받지 못하였다거나 정상적인 응답이지만 데이터 형식을 확인할 수 없기 때문에 error 콜백이 호출될 수 있습니다.
		    // 예를 들어, dataType을 지정해서 응답 받을 데이터 형식을 지정하였지만, 서버에서는 다른 데이터형식으로 응답하면  error 콜백이 호출되게 됩니다.
		 
			  result = false;
			  resultMsg = error;
			  
			  console.log('#error');
			  console.log(error);
			  console.log(status);
			  console.log(xhr);
		  },
		  complete : function(xhr, status){
		    // success와 error 콜백이 호출된 후에 반드시 호출됩니다.
		    // try - catch - finally의 finally 구문과 동일합니다.				
				console.log("this is cobook updateLastPage");
				console.log('result : '+ result);
				console.log('resultMsg : '+ resultMsg);
				console.log('ebook_no : '+ebook_no);
				console.log('member_no : '+member_no);
				
		  }
		});

}