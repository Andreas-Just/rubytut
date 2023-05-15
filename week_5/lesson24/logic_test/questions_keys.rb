# encoding: utf-8
#
# Тест на абстрактное логическое мышление
#
# http://syntone.ru/psytesty/test-logicheskogo-myshleniya
#
# Версия c соблюдением стандартов форматирования кода ruby

# Объявим константу QUESTIONS c массивом вопросов теста (каждый элемент —
# массив, в котором первый элемент — вопрос, а второй и следующие — варианты
# ответа)
QUESTIONS = [
  ['Некоторые улитки являются горами. Все горы любят кошек. Следовательно, ' \
   ' все улитки любят кошек:',
   'правильно',
   'не правильно'],
  ['Все крокодилы могут летать. Все великаны являются крокодилами. '\
    'Следовательно, все великаны могут летать:',
   'правильно',
   'не правильно'],
  ['Некоторые кочаны капусты являются паровозами. Некоторые паровозы играют ' \
   ' на рояле. Следовательно, некоторые кочаны капусты играют на рояле:',
   'правильно',
   'не правильно'],
  ['Две рощи никогда не похожи друг на друга. Сосны и ели выглядят ' \
   'совершенно одинаково. Следовательно, сосны и ели не являются двумя рощами:',
   'правильно',
   'не правильно'],
  ['Никто не может стать президентом, если у него красный нос. '\
   'У всех людей нос красный. Следовательно, никто не может быть президентом:',
   'правильно',
   'не правильно'],
  ['Все вороны собирают картины. Некоторые собиратели картин сидят в птичьей ' \
   ' клетке. Следовательно, некоторые вороны сидят в птичьей клетке:',
   'правильно',
   'не правильно'],
  ['Только плохие люди обманывают или крадут. Екатерина — хорошая.',
   'Екатерина обманывает.',
   'Екатерина крадет.',
   'Екатерина не крадет.',
   'Екатерина обманывает и крадет.',
   'Екатерина не обманывает.',
   'Все умозаключения не правильны.'],
  ['Все воробьи не умеют летать. У всех воробьев есть ноги.',
   'Воробьи без ног могут летать.',
   'Некоторые воробьи не имеют ног.',
   'Все воробьи, у которых есть ноги — не могут летать.',
   'Воробьи не умеют летать, потому что у них есть ноги.',
   'Воробьи не умеют летать, и у них нет ног.'],
  ['Некоторые люди — европейцы. Европейцы — трёхноги.',
   'У некоторых людей три ноги.',
   'Европейцы, являющиеся людьми, иногда трёхноги.',
   'Люди с двумя ногами — не являются европейцами.',
   'Европейцы — это люди с тремя ногами.',
   'Европейцы с двумя ногами иногда являются людьми.'],
  ['Цветы — это зелёные животные. Цветы пьют водку.',
   'Все зелёные животные пьют водку.',
   'Все зелёные животные являются цветами.',
   'Некоторые зелёные животные пьют водку.',
   'Цветы, которые пьют водку, являются зелёными животными.',
   'Зелёные животные не являются цветами.'],
  ['Каждый квадрат круглый. Все квадраты красные.',
   'Бывают квадраты с красными углам.',
   'Бывают квадраты с круглыми углами.',
   'Бывают круглые красные углы.',
   'Углы и квадраты круглые и красные.',
   'У красных квадратов круглые углы.',
   'Все умозаключения не правильны.'],
  ['Хорошие начальники падают с неба. Плохие начальники могут петь.',
   'Плохие начальники летят с неба вниз.',
   'Хорошие начальники, которые умеют летать — могут петь.',
   'Некоторые плохие начальники не могут петь.',
   'Некоторые хорошие начальники плохи, так как они умеют петь.',
   'Плохие начальники не падают с неба.',
   'Все умозаключения не правильны.']
]

# Объявим константу KEYS c массивом правильных ключей к каждому вопросу.
# Используем специальный литерал массива %w(), который позволяет удобно создать
# массив строк.
KEYS = %w(2 1 2 1 1 2 6 3 1,3,4 3,4 6 6)

# Такая запись эквивалентна этой:
# KEYS = ['2', '1', '2', '1', '1', '2', '6', '3', '1,3,4', '3,4', '6', '6']
