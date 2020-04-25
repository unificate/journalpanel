const queuedButton = document.getElementById("queued");
const changesTable = document.getElementById("changes");
const committedButton = document.getElementById("committed");
const executedTable = document.getElementById("executed");

console.log("2")
console.log(queuedButton)
console.log(committedButton)

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
