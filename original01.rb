def janken #じゃんけんプログラム開始
puts "ジャン！ケン！" #プログラム開始時に表示される1行目 
puts "[0]:グー[1]:チョキ[2]:パー" #プログラム開始時に表示される2行目

player_hand = gets.to_i #プレイヤーが入力した値を整数として認識する
if player_hand > 2 #プレイヤーが3以上の数字を入力した場合
    puts"入力された値が無効です" #3以上の数字を入力した場合のエラーメッセージ
    return true #3以上が入力されたらじゃんけんプログラムの最初に戻る（リターンする）
end #ifの閉じタグ

cpu_hand = rand(3) #cpuが出す手を3種類からランダムで表示する
jankens=["グー","チョキ","パー"] #関数を使って0~2で選べる値を代入する

puts "あなた:#{jankens[player_hand]}, CPU:#{jankens[cpu_hand]}" #代入した値を表示する
if player_hand == cpu_hand #プレイヤーとcpuの選択した数字が同じだったら
	puts "あいこ" #あいこが表示される
	return true #2行目に戻る（リターンする）
elsif (player_hand == 0 && cpu_hand ==1) ||(player_hand == 1 && cpu_hand ==2) || (player_hand == 2 && cpu_hand ==0) #勝ちになる数字の入力パターンを「かつ」を使って表す
	puts "指差す方向を決めてください" #勝ちパターンのメッセージが表示する
	@result_janken = "win" #あっち向いてホイとの結果に合わせて勝敗を決める為に、ジャンケンの結果を関数にしてまとめる
   return acchimuite_hoi #あっち向いホイプログラムに送る。returnはリターンだけではなく、ワープすることもできる
else #勝ちになるパターンでもあいこになるパターンでもない場合
	puts "見る方向を決めてください" #負けパターンのメッセージが表示される
	@result_janken = "lose" #あっち向いてホイとの結果に合わせて勝敗を決める為に、ジャンケンの結果を関数にしてまとめる
	return acchimuite_hoi #あっち向いホイプログラムに送る。returnはリターンだけではなく、ワープすることもできる
end #ifの閉じタグ
end #じゃんけんプログラムの閉じタグ

def acchimuite_hoi #あっち向いてホイプログラム開始
puts "あっち向いて…" #プログラム開始時に表示される1行目 
puts "[0]:上[1]:下[2]:右[3]:左" #プログラム開始時に表示される2行目

player_that_way = gets.to_i #プレイヤーが入力した値を整数として認識する
if player_that_way > 3 #プレイヤーが4以上の数字を入力した場合
    puts"入力された値が無効です" #4以上の数字を入力した場合のエラーメッセージ
    return true #4以上が入力されたらあっち向いてホイプログラムの最初に戻る（リターンする）
end #ifの閉じタグ

cpu_that_way = rand(4) #cpuが出す手を4種類からランダムで表示する
that_ways=["上","下","右","左"] #関数を使って0~3で選べる値を代入する

puts "あなた:#{that_ways[player_that_way]}, CPU:#{that_ways[cpu_that_way]}" #代入した値を表示する
if player_that_way == cpu_that_way && @result_janken == "win" #プレイヤーとcpuの数字の選択が同じで、プレイヤーがじゃんけんで勝っていた場合
	puts "あなたの勝ちです" #じゃんけんとあっち向いてホイの両方に勝っていた場合に表示される
	return false #勝負がついたので、リターンせずにゲームを終了します。
elsif player_that_way == cpu_that_way && @result_janken == "lose" #プレイヤーとcpuの数字の選択が同じで、プレイヤーがじゃんけんで負けていた場合
	puts "あなたの負けです" #じゃんけんとあっち向いてホイの両方に負けていた場合に表示される
	return false #勝負がついたので、リターンせずにゲームを終了します。
else #それ以外
return true #じゃんけんゲームに戻る
end #ifの閉じタグ
end #あっち向いてホイプログラムの閉じタグ

next_game = true #returnのtrueに変数next_gameを設定する

while next_game #trueに行き着くと、処理を繰り返し実行する制御構造式。falseに行き着くまでワープされ続ける
    next_game = janken #trueはnext_gameという変数が設定されていて、next_gameはdef jankenにワープする
end #while文の閉じタグ