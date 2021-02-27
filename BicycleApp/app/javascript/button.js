$(function (){
  $judges = $(".form-group").find("span");
  if ($judges.length) {
    $(".btn-post").prop({disabled: true, id: "btn-bad"});
    $(".btn-message").html("<span>※はすべて入力してください</span>");
  } else {
    $(".btn-post").prop("disabled", false).removeAttr("id");
    $(".btn-message").empty();
  }

  $(".desc-count,.title-count,.place-count,.required_time-count").on("keyup", function() {
    // form-groupにerrorの表示(span)があるか探す
    $judges = $(".form-group").find("span");
    // errorの表示があるなら、ボタンを不活性化して色をグレーに
    if ($judges.length) {
      $(".btn-post").prop({disabled: true, id: "btn-bad"});
      $(".btn-message").html("<span>※はすべて入力してください</span>");
      // errorの表示がなければ投稿可能にしてbtn-messageを消す
    } else {
      $(".btn-post").prop("disabled", false).removeAttr("id");
      $(".btn-message").empty();
    }
  });


// areaとrequired_timeの変化にも対応
  $(".area-count,.required_time-count").on("change", function() {
    $judges = $(".form-group").find("span");

    if ($judges.length) {
      $(".btn-post").prop({disabled: true, id: "btn-bad"});
      $(".btn-message").html("<span>※はすべて入力してください</span>");
    } else {
      $(".btn-post").prop("disabled", false).removeAttr("id");
      $(".btn-message").empty();
    }
  });
});
