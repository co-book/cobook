
      // Enter an API key from the Google API Console:

      //   https://console.developers.google.com/apis/credentials

      var apiKey = 'AIzaSyCLxZq7qPoyK_Fuhmp5_NehcppLdllvyBU';



      // Enter the API Discovery Docs that describes the APIs you want to

      // access. In this example, we are accessing the People API, so we load

      // Discovery Doc found here: https://developers.google.com/people/api/rest/

      var discoveryDocs = ["https://people.googleapis.com/$discovery/rest?version=v1"];



      // Enter a client ID for a web application from the Google API Console:

      //   https://console.developers.google.com/apis/credentials?project=_

      // In your API Console project, add a JavaScript origin that corresponds

      //   to the domain where you will be running the script.

      var clientId = '940646612600-hv6fh77tdp7qk82tpeop22el5il51u3g.apps.googleusercontent.com';



      // Enter one or more authorization scopes. Refer to the documentation for

      // the API or https://developers.google.com/people/v1/how-tos/authorizing

      // for details.

      var scopes = 'https://www.googleapis.com/auth/user.birthday.read';



      var authorizeButton = document.getElementById('authorize-button');

     // var signoutButton = document.getElementById('signout-button');



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

          // Listen for sign-in state changes.

          gapi.auth2.getAuthInstance().isSignedIn.listen(updateSigninStatus);



          // Handle the initial sign-in state.

          updateSigninStatus(gapi.auth2.getAuthInstance().isSignedIn.get());


          authorizeButton = document.getElementById("authorize-button");
          authorizeButton.onclick = handleAuthClick;
        });

      }



      function updateSigninStatus(isSignedIn) {

    	  
        if (isSignedIn) {

          makeApiCall();
        } else {

        }

      }



      function handleAuthClick(event) {


    	  options = new gapi.auth2.SigninOptionsBuilder();
    	  options.setPrompt('consent');
    	  options.setScope('profile').setScope('email');
       	  gapi.auth2.getAuthInstance().signIn(options);
      }



      function handleSignoutClick(event) {

        gapi.auth2.getAuthInstance().signOut();

      }



      // Load the API and make an API call.  Display the results on the screen.

      function makeApiCall() {

        gapi.client.people.people.get({

          resourceName: 'people/me'

        }).then(function(resp) {

		  setGoogleProFile(resp.result);
        });

      }

      function setGoogleProFile(result){
    		
    		var sex = result.genders[0].value;
    		var email = result.emailAddresses[0].value;
    		var age = result.ageRange;
    		console.log(sex);
    		console.log(email);
    		console.log(age);
    		$("#sex").val(sex);
    		$("#email").val(email);
    		$("#age").val(age);
    	}