var source = new EventSource("../../Controllers/Chat/getAdminStatus.php");
source.onmessage = function(event) {
    document.getElementById("status").innerHTML = event.data;
};