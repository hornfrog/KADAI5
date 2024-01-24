def janken_game
  jankens = ["グー", "チョキ", "パー"]
  line = "--------------------------"
 
  puts "じゃんけん..."
  puts "0(グー)1(チョキ)2(パー)3(戦わない)"

  player = gets.to_i  #”to_i”で自分の入力を文字列から数値に変える
  cpu =  rand(3) #"rand()"で1~3の数値をランダムに選ばせる 

  puts "ホイ！"
  puts line

  if player == 3 #じゃんけんアプリを終了
    puts "戦わずにじゃんけんを終了します"
    exit

  elsif player == cpu #あいこの場合
    puts "あいこで..."
    puts "ショ！"
   janken_game #もう一度じゃんけん
    
  elsif (player == 0) && (cpu == 1)|| #勝ちの場合
        (player == 1) && (cpu == 2)||
        (player == 2) && (cpu == 0)
    puts "あなた：#{jankens[player]}を出しました"
    puts "相手：#{jankens[cpu]}を出しました"    
    return @janken_resultA = 1 #じゃんけん勝利パターンの戻り値を保存
    puts line

  elsif (player == 1) && (cpu == 0)|| #負けの場合
        (player == 2) && (cpu == 1)||
        (player == 0) && (cpu == 2)
    puts "あなた：#{jankens[player]}を出しました"
    puts "相手：#{jankens[cpu]}を出しました"
    return @janken_resultB = 2  #じゃんけん敗北パターンの戻り値を保存
    puts line 

  else #4〜9の数値を入力した場合
    puts "0~3の数字を入力してください"  
    janken_game
  end
end

def atchi_game
  directions = ["上", "下", "右", "左"] 
  line = "--------------------------"

  puts "あっちむいて〜" 
  puts "0(上)1(下)2(右)3(左)"

  player = gets.to_i  
  cpu =  rand(4)

  puts "ホイ！"
  puts line

  if @janken_resultA && player == cpu #勝ちの場合
    puts "あなた：#{directions[player]}"
    puts "相手：#{directions[cpu]}"    
    puts "あなたの勝ちです" 
    exit #ゲーム終了

  elsif @janken_resultB && player == cpu  #負けの場合
    puts "あなた：#{directions[player]}"
    puts "相手：#{directions[cpu]}"    
    puts "あなたの負けです"  
    exit #ゲーム終了
  else
    puts "あなた：#{directions[player]}"
    puts "相手：#{directions[cpu]}"    
  end
end

while true
janken_game #じゃんけん開始
atchi_game
end