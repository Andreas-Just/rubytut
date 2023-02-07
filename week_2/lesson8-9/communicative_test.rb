# frozen_string_literal: true

version = 'Тест "Ваш уровень общительности". Версия 0.8. © andrew-just'

# Первый аргумент командной строки - имя пользователя, проходящего тест или "-v"
name = ARGV[0] || 'Whoever you are'

if name == '-v'
  # Если пользователь хочет только выяснить версию программы или просто
  # убедиться, что она работает, выводим информацию о программе и выходим.
  puts version
  exit
end

# Объявим массив вопросов и запишем в переменную questions
questions = [
  'Переживаете ли вы в ожидании важной деловой встречи?',
  'Если вам поручат выступить с докладом на каком либо мероприятии, вызовет ли это у вас чувство дискомфорта?',
  'Вы откладываете поход к врачу до последнего момента?',
  'Если вам предстоит командировка в незнакомый город, постараетесь ли вы избежать этой командировки?',
  'Вы делитесь своими мыслями и чувствами с кем бы то ни было?',
  'Вас раздражает, когда незнакомые люди на улице обращаются к вам с вопросом?',
  'Вы думаете, что людям разных поколений действительно трудно понимать друг друга?',
  'Вам сложно будет сказать человеку, чтобы он вернул вам деньги, взятые у вас несколько месяцев назад?',
  'Вам подали некачественное блюдо в кафе. Промолчите ли вы?',
  'Вы заговорите с незнакомым человеком, оставшись с ним наедине?',
  'Обнаружив в кассе, магазине, библиотеке длинную очередь, вы встанете в нее?',
  'Вам неприятно быть судьей в чужих конфликтах?',
  'Вы всегда оцениваете произведения искусства на свой вкус, не прислушиваясь к чужому мнению?',
  'Если кто то выскажет ошибочную точку зрения на хорошо известный вам вопрос, вы предпочтете промолчать и не исправлять его?',
  'Просьбы помочь в учебе или работе раздражают вас?',
  'Вам проще изложить свое мнение на бумаге, чем рассказать о нем?'
]

# Создадим массив результатов теста и запишем его в переменную results
results = [
  # 30-31 балл
  [32, "Возможно вы аутист?\n Если у вас:\n – отсутствует эмоциональный контакт с людьми;\n – реакция на внешние раздражители слабы;\n – мимическая маска глубокого покоя;\n – характерное полевое поведение (бесцельное перемещение по комнате);\n – избегание сильных стимулов, вызывающих страх (шум, яркий свет, прикосновение и т.д.).\n Вам следует обратиться к врачу!"],
  [30..31, 'Что скрывать, вы некоммуникабельны, и страдаете от этого прежде всего сами. Но и окружающим очень трудно с вами, ведь там, где необходимы совместные усилия, вы совершенно теряетесь. Почему вы так неохотно общаетесь? Неужели в вашем окружении совсем нет интересных людей? Попробуйте потренировать свою общительность — обращайтесь к людям с различными вопросами, пусть даже для начала они будут касаться только работы.'],
  # 25-29 баллов
  [25..29, 'Вы неразговорчивы, предпочитаете одиночество шумным компаниям. Друзей у вас совсем немного. Новая работа и новые люди вызывают у вас чувство дискомфорта. Эта особенность характера не ускользнула от вашего внимания, и вы часто сердитесь на себя за нее. Вспомните, как легко вы общаетесь, когда чем то очень увлечены. Ведь можете же, когда хотите.'],
  # 19-24 балла
  [19..24, 'В целом вы общительный человек. Новая обстановка и новые проблемы вас не пугают. И все таки с людьми вы сходитесь осторожно, постепенно, публично высказываетесь неохотно. Иногда ваши высказывания саркастичны, даже безо всякого на то основания.'],
  # 14-18 баллов
  [14..18, 'В целом вы общительный человек. Новая обстановка и новые проблемы вас не пугают. И все таки с людьми вы сходитесь осторожно, постепенно, публично высказываетесь неохотно. Иногда ваши высказывания саркастичны, даже безо всякого на то основания.'],
  # 9-13 баллов
  [9..13, 'Вы весьма общительны, не так ли? Ваши любопытство, разговорчивость, вспыльчивость вызывают у некоторых людей раздражение и заставляют думать о вас как о легкомысленном человеке. Вы легко знакомитесь с новыми людьми, вам нравятся большие компании, особенно если вы находитесь в центре всеобщего внимания. Вам не помешает выработать в себе немного терпения и усидчивости, необходимых для решения серьезных проблем.'],
  # 4-8 баллов
  [4..8, 'Вы, кажется, знакомы со всеми и все всегда обо всех знаете. Вы любите принимать участие в различных обсуждениях, хотя серьезные темы кажутся вам ужасно скучными. Привыкли высказываться даже в том случае, если недостаточно компетентны в обсуждаемом вопросе. Беретесь за любое дело, хотя не всегда можете успешно довести его до конца. Неудивительно, что руководители и коллеги относятся к вам с недоверием и никто не хочет выполнять с вами совместные задания.'],
  # 3 балла или менее
  [0..3, 'Ваша общительность чрезмерна. Вы говорливы, многословны, вспыльчивы, обидчивы, часто необъективны. Вы вмешиваетесь в дела, которые не имеют к вам никакого отношения. Беретесь судить о проблемах, в которых совершенно не разбираетесь. Часто из за вас возникают конфликты. С серьезной работой вы справиться не в состоянии. Людям очень трудно с вами. Вам необходимо воспитывать в себе терпение, сдержанность и уважительное отношение к людям.']
]


puts "Добрый день, #{name}! Ответьте пожалуйста честно на несколько вопросов, чтобы узнать кое-что о себе."

yes_answer = 1
sometimes_answer = 2
no_answer = 3
points = 0

questions.each.with_index(1) { |question, index|
  is_exception = [5, 10, 11].include?(index)

  puts "\nВопрос № #{index}. #{question}"
  puts "Введите\n #{yes_answer} - если да,\n #{sometimes_answer} - если иногда,\n #{no_answer} - если нет,\n и нажмите Enter"

  user_input = Integer(STDIN.gets, 10, exception: false)

  unless (1..3).include?(user_input)
    puts 'Вы должны выбрать номер от 1 до 3'
    redo
  end

  if user_input == yes_answer
    unless is_exception
      points += 2
    end
  elsif user_input == sometimes_answer
    points += 1
  elsif is_exception
    points += 2
  end
}


puts "\n#{name}"
puts "\nВаш результат теста - #{points}:"

test_result = results.find { |result| result[0] === points }

puts test_result[1]
