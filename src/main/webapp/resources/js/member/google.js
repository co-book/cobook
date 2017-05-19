
      // Enter an API key from the Google API Console:

      //   https://console.developers.google.com/apis/credentials

      //var apiKey = 'AIzaSyCLxZq7qPoyK_Fuhmp5_NehcppLdllvyBU';
      var apikey = 'HVfEEL6jFLnXUFQm4MgS9G-k';
      // Enter the API Discovery Docs that describes the APIs you want to

      // access. In this example, we are accessing the People API, so we load

      // Discovery Doc found here: https://developers.google.com/people/api/rest/

      var discoveryDocs = ["https://people.googleapis.com/$discovery/rest?version=v1"];
      // Enter a client ID for a web application from the Google API Console:

      //   https://console.developers.google.com/apis/credentials?project=_

      // In your API Console project, add a JavaScript origin that corresponds

      //   to the domain where you will be running the script.

      //var clientId = '940646612600-hv6fh77tdp7qk82tpeop22el5il51u3g.apps.googleusercontent.com';
      var clientId = '1021992415536-t4k04i5ke77iq0qrq27kod9g4rtri8t5.apps.googleusercontent.com';
      // Enter one or more authorization scopes. Refer to the documentation for

      // the API or https://developers.google.com/people/v1/how-tos/authorizing

      // for details.
      var scopes = 'https://www.googleapis.com/auth/user.birthday.read';
      var loginGoogleButton = document.getElementById('loginGoogle');
      
      /**
       * Google api 초기화 작업  handleClientLoad -> initClient 실행
       * @returns
       */
      function handleClientLoad() {
        // Load the API client and auth2 library
        gapi.load('client:auth2', initClient);
      }

      function initClient() {
        gapi.client.init({
            apiKey: apiKey,
            discoveryDocs: discoveryDocs,
            clientId: clientId,
            scope: scopes
        }).then(function () {
        	//해당 구글 버튼 이벤트 부여
 //       	loginGoogleButton = document.getElementById("loginGoogle");
 //       	loginGoogleButton.onclick =  googleLogin;
        });

      }
      
      
      /**
       * 구글 로그인 -> 구글 아이디 상태 체크 
       * 	-성공 : getGoogle (구글에서 데이터 받아옴)
       * 	-실패 : 로그인창 띄워줌 -> 처리후 googleLogin()한번더 실행
       * @returns
       */
      function googleLogin(loginType) {
    	  var isSignedIn = gapi.auth2.getAuthInstance().isSignedIn.get();
    	  //로그인 체크
        if (isSignedIn) {
        	//로그인 Ok - > 구글 정보 가져옴
        	getGoogle(loginType);
        } else {
        	//로그인 No 
      	  	options = new gapi.auth2.SigninOptionsBuilder();
      	  	options.setPrompt('consent');
      	  	options.setScope('profile').setScope('email');
        	gapi.auth2.getAuthInstance().signIn(options).then(function(){//로그인 다시띄워줌
        		 if(gapi.auth2.getAuthInstance().isSignedIn.get()){
        			 googleLogin(loginType); //로그인 성공시 
            	 }
        	 });	
        	 
        	 
        }

      }




      // Load the API and make an API call.  Display the results on the screen.

      function getGoogle(loginType) {
        gapi.client.people.people.get({

          resourceName: 'people/me'

        }).then(function(resp) {

        	var gender = resp.result.genders[0].value;
    		var email = resp.result.emailAddresses[0].value;
    		var age = resp.result.ageRange;
    		var nickname =resp.result.names[0].displayName;

    		coMember.loginType=loginType;
    		coMember.email=email;
    		coMember.age=age;
    		coMember.gender=gender;
    		coMember.nickname=nickname;
     		
    		coMember.cobookLogin();
        });

      }
      

      /**
       * 로그아웃 
       * @param event
       * @returns
       */
      function handleSignoutClick(event) {

        gapi.auth2.getAuthInstance().signOut();

      }

