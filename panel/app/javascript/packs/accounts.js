import {MDCFormField} from '@material/form-field';
import {MDCRadio} from '@material/radio';
import {MDCRipple} from '@material/ripple';
import {MDCTextField} from '@material/textfield';

document.addEventListener('turbolinks:load', () => {
    var radioButtonChecked;	
    for (let radioElement of document.querySelectorAll('.mdc-radio')) {
        const radio = new MDCRadio(radioElement);
        const formField = new MDCFormField(radioElement.parentElement);
        formField.input = radio;
    }
    for (let textField of document.querySelectorAll('.mdc-text-field')) {
        new MDCTextField(textField);
    }
    const create = new MDCRipple(document.querySelector('.mdc-button'));
    create.root_.onclick = () => {
	const buttonValue = getButtonValue();
        const xhttp = new XMLHttpRequest();
	const xhttp2 = new XMLHttpRequest();    
        xhttp.onload = () => {
            console.log(xhttp.responseText);
            if (xhttp.status == 200) {
                location.reload()
            }
        }
	xhttp2.onload = () => {
            console.log(xhttp2.response.Text);
            if (xhttp2.status == 200) {
                location.reload()
            }
	}


        xhttp.open('POST', 'users');
        xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        const token = document.getElementsByName("csrf-token");
        if (token.length > 0) {
            xhttp.setRequestHeader('X-CSRF-Token', token[0].content);
        }
        xhttp.send('user[username]=' + username.value + '&user[password]=' + password.value + '&buttonvalue=' + buttonValue);
        
	/*Send a second POST request to add the user to a group*/
	xhttp2.open('POST', 'create');
        xhttp2.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        if (token.length > 0) {
            xhttp2.setRequestHeader('X-CSRF-Token', token[0].content);
        }
        xhttp2.send('username=' + username.value + '&buttonvalue=' + buttonValue);
    }

	/*Get the value for the selected radio button*/
	function getButtonValue(){
	   
           var radio1 = document.getElementById("radio-admin-new");
           var radio2 = document.getElementById("radio-developer-new");
           var radio3 = document.getElementById("radio-productowner-new");
           var radio4 = document.getElementById("radio-releasemanager-new");
                        
           if(radio1.checked == true) 
              return(radio1.value);
           else if(radio2.checked == true) 
              return(radio2.value);
           else if(radio3.checked == true) 
              return(radio3.value);
           else if(radio4.checked == true) 
              return(radio4.value);

       }

});
