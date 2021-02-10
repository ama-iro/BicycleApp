$(document).on("click", ".image_upload", function () {
  //$liに追加するためのプレビュー画面のHTML
  var preview = $('<div class="image-preview__wapper"><img class="preview"></div><div class="image-preview_btn"><button type="button" class="btn btn-dark image-preview_btn_delete">Delete</button></div>');
    //次の画像を読み込むためのinput。
  var append_input = $(`<li class="input"><label class="upload-label"><div class="upload-label__text"><i class="far fa-images"><br>クリック、または画像をドラッグ</i><div class="input-area"><input class="hidden image_upload" type="file"></div></div></label></li>`)

  $ul = $("#previews");
  $li = $(this).parents("li");
  $label = $(this).parents(".upload-label");
  $inputs = $ul.find(".image_upload");


  //inputに画像を読み込んだら、"プレビューの追加"と"新しいli追加"処理が動く
  $(".image_upload").on("change", function (e) {
    //inputで選択した画像を読み込む
    var reader = new FileReader();

    // プレビューに追加させるために、inputから画像ファイルを読み込む。
    reader.readAsDataURL(e.target.files[0]);

    //画像ファイルが読み込んだら、処理が実行される。
    reader.onload = function (e) {
      //previewをappendで追加する前に、プレビューできるようにinputで選択した画像を<img>に'src'で付与させる
      $(preview).find(".preview").attr("src", e.target.result);
    };

    //inputの画像を付与した,previewを$liに追加。
    $li.append(preview);

    //プレビュー完了後は、inputを非表示にさせる。これによりプレビューだけが残る。
    $label.css("display", "none");
    $li.removeClass("input");
    $li.addClass("image-preview");
    $lis = $ul.find(".image-preview");

    $("#previews li").css({
      width: `20%`

    });
    //"ul"に新しい"li(inputボタン)"を追加させる。
    if ($lis.length <= 4) {
      $li.addClass("image-preview");
      $ul.append(append_input);
      $("#previews li:last-child").css({
        width: `calc(100% - (20% * (${$lis.length})))`,
      });
    }

    //inputの最後の"data-image"を取得して、input nameの番号を更新させてる。
    $inputs.each(function (num, input) {
      //image_urlの番号を更新するために、現在の番号を除去
      $(input).removeAttr("image_url");
      $(input).attr({
        image_url: "post[images_attributes][" + num + "][image_url]",
        id: "post_images_attributes_" + num + "_image_url",
      });
    });
  });
});
