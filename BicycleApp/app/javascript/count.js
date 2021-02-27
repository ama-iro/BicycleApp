$(function (){
  // 処理（ページが読み込まれた時、フォームに残り何文字入力できるかを数えて表示する）

  //フォームに入力されている文字数を数える
  //\nは"改行"に変換して2文字にする。オプションフラグgで文字列の最後まで\nを探し変換する
  var desc_count = $(".desc-count").text().replace(/\n/g, "改").length;
  //残りの入力できる文字数を計算
  var now_count_desc = 400 - desc_count;
  //文字数が0またはオーバーしていたら文字色を赤にして表示
  if (desc_count > 400) {
    $(".desc-text-count").css("color","red");
    $(".desc-error").html("<span>文字数オーバーです</span>").css("color","red");
  } else if (desc_count == 0) {
    $(".desc-error").html("<span>何か入力してください</span>").css("color","red");
  }

  //残りの入力できる文字数を表示
  $(".desc-text-count").text( "残り" + now_count_desc + "文字");

  $(".desc-count").on("keyup", function() {
    // 処理（キーボードを押した時、フォームに残り何文字入力できるかを数えて表示する）
    //フォームのvalueの文字数を数える
    var desc_count = $(this).val().replace(/\n/g, "改").length;
    var now_count_desc = 400 - desc_count;

    // 400文字より上、または0文字で.showで警告文表示.適正文字数内なら .hide　で消す
    if (desc_count > 400) {
      $(".desc-text-count").css("color","red");
      $(".desc-error").html("<span>文字数オーバーです</span>").css("color","red");
    } else if (desc_count == 0) {
      $(".desc-error").html("<span>何か入力してください</span>").css("color","red");
    } else {
      $(".desc-text-count").css("color","black");
      $(".desc-error").empty("desc-error");
    }
    $(".desc-text-count").text( "残り" + now_count_desc + "文字");
  });

  // 同様にtitleも。ただし改行は必要ないので対応部は消す
  var title_count = $(".desc-count").text().length;
  var now_count_title = 20 - desc_count;
  if (title_count > 20) {
    $(".title-text-count").css("color","red");
    $(".title-error").html("<span>文字数オーバーです</span>").css("color","red");
  } else if (title_count == 0) {
    $(".title-error").html("<span>何か入力してください</span>").css("color","red");
  }
  $(".title-text-count").text( "残り" +now_count_title + "文字");


  $(".title-count").on("keyup", function() {
    var title_count = $(this).val().length;
    var now_count_title = 20 - title_count;
    if (title_count > 20) {
      $(".title-text-count").css("color","red");
      $(".title-error").html("<span>文字数オーバーです</span>").css("color","red");
    } else if (title_count == 0) {
      $(".title-error").html("<span>何か入力してください</span>").css("color","red");
    } else {
      $(".title-text-count").css("color","black");
      $(".title-error").empty("title-error");
    }
    $(".title-text-count").text( "残り" + now_count_title + "文字");
  });



  // place,repuired_time,areaについても行う。
  // 字数制限はないので、記入されているかいないかで判断し、記入が無ければ警告文を出す。

  var place_count = $(".place-count").val();
  var required_time_count = $(".required_time-count").val();
  var area_count = $(".area-count").val().length;

  if (place_count == "")  {
    $(".place-error").html("<span>何か入力してください</span>").css("color","red");
  }

  if (required_time_count == "")  {
    $(".required_time-error").html("<span>所要時間を入力してください</span>").css("color","red");
  }

  if (area_count == 0)  {
    $(".area-error").html("<span>地域を選択してください</span>").css("color","red");
  }


// place
  $(".place-count").on("keyup", function() {
    var place_count = $(this).val().length;

    if (place_count == 0) {
      $(".place-error").html("<span>何か入力してください</span>").css("color","red");
    } else {
      $(".place-error").empty("place-error");
    }
  });

// required_time
// クリック、入力の二つに対応。要改良
  $(".required_time-count").on("change", function() {
    var required_time_count = $(this).val().length;

    if (required_time_count == 0) {
      $(".required_time-error").html("<span>所要時間を入力してください</span>").css("color","red");
    } else {
      $(".required_time-error").empty("required_time-error");
    }
  });

  $(".required_time-count").on("keyup", function() {
    var required_time_count = $(this).val().length;

    if (required_time_count == 0) {
      $(".required_time-error").html("<span>所要時間を入力してください</span>").css("color","red");
    } else {
      $(".required_time-error").empty("required_time-error");
    }
  });

// area
  $(".area-count").on("change", function() {
    var area_count = $(this).val().length;

    if (area_count == 0) {
      $(".area-error").html("<span>地域を選択してください</span>").css("color","red");
    } else {
      $(".area-error").empty("area-error");
    }
  });

});
