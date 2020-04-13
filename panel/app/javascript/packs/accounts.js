window.openPasswordModal = user => {
    document.getElementById("password-modal-text").innerText = "Enter the new password for " + user;
    document.getElementById("password-modal-username").innerText = user;
    $("#password-modal").modal();
}

window.openDeleteModal = user => {
    document.getElementById("delete-modal-text").innerText = "Are you sure that you want to delete " + user + "?";
    document.getElementById("delete-modal-username").innerText = user;
    $("#delete-modal").modal();
}

window.changePassword = () => {
    const user = document.getElementById("password-modal-username").innerText;
    const password = document.getElementById("password-modal-password").value;
    const xhttp = new XMLHttpRequest();
    xhttp.open('PUT', 'users/edit');
    xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    const token = document.getElementsByName("csrf-token");
    if (token.length > 0) {
        xhttp.setRequestHeader('X-CSRF-Token', token[0].content);
    }
    xhttp.send('user[username]=' + user + '&user[password]=' + password);
    $("#password-modal").modal('toggle');
};

window.deleteUser = () => {
    const user = document.getElementById("delete-modal-username").innerText;
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = () => {
        if (xhttp.readyState == XMLHttpRequest.DONE && xhttp.status == 204) {
            window.location.reload();
        }
    }
    xhttp.open('DELETE', 'users');
    xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    const token = document.getElementsByName("csrf-token");
    if (token.length > 0) {
        xhttp.setRequestHeader('X-CSRF-Token', token[0].content);
    }
    xhttp.send('user[username]=' + user);
    $("#delete-modal").modal('toggle');
}

window.setUserRole = (user, role) => {
    console.log("Setting the role of " + role + " to user: " + user);
    const xhttp = new XMLHttpRequest();
    xhttp.open('PUT', 'users');
    xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    const token = document.getElementsByName("csrf-token");
    if (token.length > 0) {
        xhttp.setRequestHeader('X-CSRF-Token', token[0].content);
    }
    xhttp.send('user[username]=' + user + '&user[role]=' + role);
};
