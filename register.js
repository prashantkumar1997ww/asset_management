// function Register()
// {
//     var name = document.forms["RegForm"]["Name"].value;    
//     var phone = document.forms["RegForm"]["Number"].value;  
//     var username =  document.forms["RegForm"]["UserName"].value;  
//     var password = document.forms["RegForm"]["Password"].value;

//     if (name == null || name == '')                                  
//     { 
//         window.alert("Please enter your name.");  
//         return false; 
//     } 

//     if (phone == null || phone == '')                               
//     { 
//         window.alert("Please enter your mobile number.");  
//         return false; 
//     } 
    
//     if (username == null || username == '')                                   
//     { 
//         window.alert("Please enter a valid username."); 
//         return false; 
//     } 

//     if (password == null || password == '')                        
//     { 
//         window.alert("Please enter your password"); 
//         return false; 
//     } 

//     if (cpassword == null || cpassword == '')                  
//     { 
//         alert("Please enter your confirm password."); 
//         return false; 
//     } 

//     if(password.length < 8)
//     {
//         alert("Password is less than 8 charactor");
//         return false;
//     }

//     return true;
// }

function validate()
{
			var first_name= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
			var number= /^[0-9]+$/; //pattern allowed number 0-9 
			var email_valid= /^[\w\d\.]+\@[a-zA-Z\.]+\.[A-Za-z]{1,4}$/; //pattern valid email validation
			var password_valid=/^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/; //pattern password allowed A to Z, a to z, 0-9, !@#$%&*()<> charecter 
			
			var fname = document.getElementById("name"); //textbox id fname
            var lname = document.getElementById("number"); //textbox id lname
            var email = document.getElementById("email"); //textbox id email
            var password = document.getElementById("password"); //textbox id password
			
			if(!first_name.test(name.value) || name.value=='') 
            {
				alert("Enter Firstname Alphabet Only....!");
                fname.focus();
                fname.style.background = '#f08080';
                return false;                    
            }
			if(!last_name.test(number.value) || number.value=='') 
            {
				alert("Enter Number Only....!");
                lname.focus();
                lname.style.background = '#f08080';
                return false;                    
            }
			if(!email_valid.test(email.value) || email.value=='') 
            {
				alert("Enter Valid Email....!");
                email.focus();
                email.style.background = '#f08080';
                return false;                    
            }
			if(!password_valid.test(password.value) || password.value=='') 
            {
				alert("Password Must Be 6 to 12 and allowed !@#$%&*()<> character");
                password.focus();
                password.style.background = '#f08080';
                return false;                    
            }
}