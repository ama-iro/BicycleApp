$(function () {
    // ラジオボタンを選択変更したら実行
  $('input[name="image_change"]').change(function () {

      var val = $(this).val();


      if (val == "change") {
          $("#image-area").removeClass("edit_radio_button");
          $(".edit_image_upload").prop("disabled", false);
          $(".clearfix:not(:eq(0))").remove();
        } else if (val == "not_change") {
          $("#image-area").addClass("edit_radio_button");
          $(".edit_image_upload").prop("disabled", true);
        }
  });

  $("#image-area").on("change", function() {
    var image_count = $("#previews").find(".image-preview")
    $('input:hidden[name="image_count"]').val(image_count.length)
  })

});
