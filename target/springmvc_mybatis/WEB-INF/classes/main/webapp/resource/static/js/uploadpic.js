function uploadPhoto() {
    $("#photoFile").click();
}
/**
 * 上传图片
 */
function upload() {
    if ($("#photoFile").val() == '') {
        return;
    }
    var formData = new FormData();
    formData.append('photo', document.getElementById('photoFile').files[0]);
    $.ajax({
        url:"uploadPhoto.action",
        type:"post",
        data: formData,
        contentType: false,
        processData: false,
        success: function(data) {
            if (data.type == "success") {
                $("#preview_photo").attr("src", data.filepath+data.filename);
                $("#productImg").val(data.filename);
            } else {
                alert(data.msg);
            }
        },
        error:function(data) {
            alert("上传失败")
        }
    });
}