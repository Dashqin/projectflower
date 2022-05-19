let addTaskBtn = document.querySelector(".add-task");
let taskInput = document.querySelector("input.task-title");
let taskWrapper = document.querySelector(".tasks .list-group");

var d = new Date();

let clear=document.querySelector(".delete-tasks button");


addTaskBtn.onclick = () => {
    if (taskInput.value.trim() !== "") {
        let newTaskElem = "<li class='list-group-item'>" + taskInput.value + d + "</li>"
        taskWrapper.innerHTML = newTaskElem + taskWrapper.innerHTML ;
        taskInput.value = "";
    }
    else {
        alert("Can't add an empty task!");
    }
}
document.addEventListener("keyup",function(e){
    if(e.keyCode == 13){
        if (taskInput.value.trim() !== "") {
            let newTaskElem = "<li class='list-group-item'>" + taskInput.value + d + "</li>"
            taskWrapper.innerHTML = newTaskElem + taskWrapper.innerHTML ;
            taskInput.value = "";
        }
        else {
            alert("Can't add an empty task!");
        }
    }
}
)
document.getElementById("btn2").addEventListener("click", function a(){
        taskWrapper.innerHTML= "";
})