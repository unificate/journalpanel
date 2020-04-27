const queuedButton = document.getElementById("queued");
const changesTable = document.getElementById("transactions");
const committedButton = document.getElementById("committed");
const executedTable = document.getElementById("executed");

queuedButton.onclick = () => {
    console.log("Clicked")
    executedTable.style.display = "none";
    changesTable.style.display = "block";
}

committedButton.onclick = () => {
    console.log("Clicked")
    executedTable.style.display = "block";
    changesTable.style.display = "none";
}
