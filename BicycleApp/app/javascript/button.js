$(function (){

  $(".desc-count,.title-count,.place-count,.required_time-count").on("keyup", function() {
    // errorの表示があるか探す
    $judges = $(".form-group").find("span");
    $(".testp").text($judges.length)
    // errorの表示があるなら、ボタンを不活性化して色をグレーに
    if ($judges.length) {
      $(".btn-post").prop("disabled", true);
    } else {
      $(".btn-post").prop("disabled", false);
    }


  });

  $(".area-count,.required_time-count").on("change", function() {
    // errorの表示があるか探す
    $judges = $(".form-group").find("span");
    // errorの表示があるなら、ボタンを不活性化して色をグレーに

    if ($judges.length) {
      $(".btn-post").prop("disabled", true);
    } else {
      $(".btn-post").prop("disabled", false);
    }
  });


});
