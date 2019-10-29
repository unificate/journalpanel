import {MDCRipple} from '@material/ripple';
import {MDCTextField} from '@material/textfield';

document.addEventListener("turbolinks:load", function() {
    const username = new MDCTextField(document.querySelector('#username-field'));
    const password = new MDCTextField(document.querySelector('#password-field'));
    const login = new MDCRipple(document.querySelector('.mdc-button'));
});
