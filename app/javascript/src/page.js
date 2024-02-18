function PageTopAnime() {
  let scroll = $(window).scrollTop(); // スクロール値を取得
  let wH = window.innerHeight; // 画面の高さを取得
  let footerPos = $('#footer').offset().top; // footerの位置を取得

  // ページトップボタンの表示・非表示の制御
  if (scroll >= 200) {
    $('#page-top').removeClass('DownMove').addClass('UpMove'); // DownMoveクラスを除去し、UpMoveクラスを追加
  } else {
    $('#page-top').removeClass('UpMove').addClass('DownMove'); // UpMoveクラスを除去し、DownMoveクラスを追加
  }

  // ページトップボタンの位置の制御
  if (scroll + wH >= footerPos + 10) {
    let pos = scroll + wH - footerPos + 15; // スクロール値＋画面の高さからfooterの位置＋10pxを引いた位置を計算
    $('#page-top').css('bottom', pos); // #page-topに位置を適用
  } else if ($('#page-top').hasClass('UpMove')) {
    $('#page-top').css('bottom', '10px'); // ページトップリンクが表示されている場合は下から10pxの位置に固定
  }
}

// 画面をスクロールした際の動作
$(window).on('scroll', function () {
  PageTopAnime(); // PageTopAnime関数の呼び出し
});

// ページが読み込まれた際の動作
$(window).on('load', function () {
  PageTopAnime(); // PageTopAnime関数の呼び出し
});

// ページトップボタンをクリックした際の動作
$('#page-top').on('click', function () {
  $('body,html').animate({
    scrollTop: 0 // ページトップまでスクロール
  }, 500); // スクロール速度
  return false; // リンクの無効化
});
