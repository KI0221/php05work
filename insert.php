<?php

session_start();
require_once ('funcs.php');
loginCheck();

//1. POSTデータ取得
$book_name = $_POST['book_name']; //名前を取得
$book_url = $_POST['book_url']; //URLを取得
$book_comment = $_POST['book_comment']; //コメントを取得

$user_id = $_SESSION['user_id'];// セッションからuser_idを取得する

// 画像アップロードの処理
// 画像パスを保存する用の変数を用意。空っぽにするのは、保存失敗時にもプログラムが動くようにするため
$image_path = '';

	// imageの部分はinput type="file"のname属性に相当します。
	// 必要に応じて書き換えるべき場所
  // tmp_nameは固定
  if (isset($_FILES['image'])) {

	// imageの部分はinput type="file"のname属性に相当します。
	// 必要に応じて書き換えるべき場所です。
	$upload_file = $_FILES['image']['tmp_name'];
	
	//画像の拡張子を取得
	$extension = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
	
	// 画像名を取得。今回はuniqid()をつかって　保存時の時刻情報をファイル名とする
	$file_name = uniqid() . '.' . $extension;
	
  // 今回はimgフォルダに保存する
	// フォルダ名を取得。今回は直書き。
	$dir_name = 'img';
	
	// image_pathを確認
	$image_path = $dir_name . $file_name;
	
  // move_uploaded_file()で、一時的に保管されているファイルをimage_pathに移動させる。
  // if文の中で関数自体が実行される書き方をする場合、成功か失敗かが条件に設定される
  // 失敗した場合はエラー表示を出して終了する
  // if (!move_uploaded_file($upload_file, $image_path)) {
  //   exit('ファイルの移動に失敗しました。');
  // }

}

//2. DB接続します
require_once('funcs.php');
$pdo = db_conn();

//３．データ登録SQL作成

// 1. SQL文を用意
$stmt = $pdo->prepare("INSERT INTO gs_bookmark_table(book_name, book_url, book_comment, image, date) VALUES(:book_name, :book_url, :book_comment, :image, NOW())");

//  2. バインド変数を用意
// Integer 数値の場合 PDO::PARAM_INT
// String文字列の場合 PDO::PARAM_STR

$stmt->bindValue(':book_name', $book_name, PDO::PARAM_STR);
$stmt->bindValue(':book_url', $book_url, PDO::PARAM_STR);
$stmt->bindValue(':book_comment', $book_comment, PDO::PARAM_STR);
$stmt->bindValue(':image', $image_path, PDO::PARAM_STR);

//  3. 実行
$status = $stmt->execute();

//４．データ登録処理後
if($status === false){
  //SQL実行時にエラーがある場合（エラーオブジェクト取得して表示）
  $error = $stmt->errorInfo();
  exit('ErrorMessage:'.$error[2]);
}else{
  //５．index.phpへリダイレクト
  header("Location: index.php");
}
?>
