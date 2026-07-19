import 'package:cloud_firestore/cloud_firestore.dart';

Map<String, dynamic> answer(String title, bool isCorrect) {
  return {
    'title': title,
    'isCorrect': isCorrect,
  };
}

Map<String, dynamic> question(
  String title,
  List<Map<String, dynamic>> answers,
) {
  return {
    'title': title,
    'answers': answers,
  };
}

Future<void> addQuizzes() async {
  final firestore = FirebaseFirestore.instance;
  final batch = firestore.batch();

  final quizzes = [
    {
      'id': 1,
      'title': 'Анатомия',
      'questions': [
        question(
          'Какая часть тела человека является самой большой по площади?',
          [
            answer('Печень', false),
            answer('Кожа', true),
            answer('Тонкий кишечник', false),
            answer('Легкие', false),
          ],
        ),
        question(
          'Сколько костей в скелете взрослого человека в среднем?',
          [
            answer('150', false),
            answer('206', true),
            answer('300', false),
            answer('180', false),
          ],
        ),
        question(
          'Как называется самая длинная кость в теле человека?',
          [
            answer('Большеберцовая кость', false),
            answer('Плечевая кость', false),
            answer('Лучевая кость', false),
            answer('Бедренная кость', true),
          ],
        ),
        question(
          'Из какой камеры сердца выходит аорта?',
          [
            answer('Из правого желудочка', false),
            answer('Из левого желудочка', true),
            answer('Из правого предсердия', false),
            answer('Из левого предсердия', false),
          ],
        ),
        question(
          'Какая часть глаза определяет его цвет?',
          [
            answer('Хрусталик', false),
            answer('Стекловидное тело', false),
            answer('Сетчатка', false),
            answer('Радужка', true),
          ],
        ),
        question(
          'Какой орган участвует в речи, жевании и глотании?',
          [
            answer('Язык', true),
            answer('Трахея', false),
            answer('Желчный пузырь', false),
            answer('Мочевой пузырь', false),
          ],
        ),
      ],
    },
    {
      'id': 2,
      'title': 'География',
      'questions': [
        question(
          'Какая река считается самой полноводной в мире?',
          [
            answer('Амазонка', true),
            answer('Нил', false),
            answer('Миссисипи', false),
            answer('Янцзы', false),
          ],
        ),
        question(
          'Какой океан является самым большим по площади?',
          [
            answer('Атлантический', false),
            answer('Индийский', false),
            answer('Тихий', true),
            answer('Северный Ледовитый', false),
          ],
        ),
        question(
          'Какая страна занимает первое место по численности населения?',
          [
            answer('США', false),
            answer('Индия', true),
            answer('Китай', false),
            answer('Индонезия', false),
          ],
        ),
        question(
          'Как называется самая высокая горная вершина Земли?',
          [
            answer('Килиманджаро', false),
            answer('Эльбрус', false),
            answer('Эверест (Джомолунгма)', true),
            answer('Аконкагуа', false),
          ],
        ),
        question(
          'В каком полушарии относительно экватора находится Австралия?',
          [
            answer('В Южном', true),
            answer('В Северном', false),
            answer('В обоих', false),
            answer('На экваторе', false),
          ],
        ),
        question(
          'Как называется материк, почти полностью покрытый льдом?',
          [
            answer('Гренландия', false),
            answer('Антарктида', true),
            answer('Арктика', false),
            answer('Исландия', false),
          ],
        ),
      ],
    },
    {
      'id': 3,
      'title': 'Физика',
      'questions': [
        question(
          'В каких единицах измеряется сила в системе СИ?',
          [
            answer('Ньютонах', true),
            answer('Джоулях', false),
            answer('Ваттах', false),
            answer('Паскалях', false),
          ],
        ),
        question(
          'Что обычно происходит с жидкостью при нагревании?',
          [
            answer('Она сжимается', false),
            answer('Она расширяется', true),
            answer('Она всегда замерзает', false),
            answer('Она превращается в металл', false),
          ],
        ),
        question(
          'Какой прибор используется для измерения силы тока?',
          [
            answer('Вольтметр', false),
            answer('Барометр', false),
            answer('Амперметр', true),
            answer('Термометр', false),
          ],
        ),
        question(
          'С какой скоростью движется свет в вакууме приблизительно?',
          [
            answer('300 000 км/с', true),
            answer('3000 км/с', false),
            answer('300 000 000 км/с', false),
            answer('30 км/с', false),
          ],
        ),
        question(
          'Какая сила удерживает нас на поверхности Земли?',
          [
            answer('Магнитная сила', false),
            answer('Сила трения', false),
            answer('Сила тяжести', true),
            answer('Центробежная сила', false),
          ],
        ),
        question(
          'Что происходит с молекулами воды при замерзании?',
          [
            answer('Они начинают двигаться быстрее', false),
            answer('Они испаряются', false),
            answer(
              'Они образуют упорядоченную кристаллическую структуру',
              true,
            ),
            answer('Они разделяются на атомы', false),
          ],
        ),
      ],
    },
  ];

  for (final quiz in quizzes) {
    final documentId = quiz['id'].toString();
    final document = firestore.collection('quizzes').doc(documentId);

    batch.set(document, quiz);
  }

  await batch.commit();
}