document.addEventListener('turbolinks:load', () => {
    const queuedButton = document.getElementById("queued");
    const changesTable = document.getElementById("changes");
    const committedButton = document.getElementById("committed");
    const executedTable = document.getElementById("executed");

    // New user is submitted
    queuedButton.onclick = () => {
        executedTable.style.display = "none";
        changesTable.style.display = "block";
    }

    committedButton.onclick = () => {
        executedTable.style.display = "block";
        changesTable.style.display = "none";
    }
});
