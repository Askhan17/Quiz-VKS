import 'package:flutter/material.dart';

void main() {
  runApp(QuizAppJJ());
}

class QuizAppJJ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz VKS',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _quizStarted = false;
  bool _quizCompleted = false;
  String _feedbackMessage = '';

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Qual o país conhecido como a Terra Verde na série Vikings?',
      'options': ['Groelândia', 'Islândia', 'Finlândia', 'Noruega'],
      'answer': 0,
      'image': 'ios/Flutter/assets/imagens/parisvks.png'
    },
    {
      'question':
          'Qual deus da mitologia nórdica, Floki segue com mair devoção?',
      'options': ['Thor', 'Loki', 'Odin', 'Freyja'],
      'answer': 1,
      'image.': 'https://pm1.aminoapps.com/6611/670e772694d4e9527ea00d3efdb6beb15cd3b493_hq.jpg'
    },
    {
      'question':
          'Ragnar Lothbrok, viajou para diversos lugares ao longo da trama. Qual foi o primeiro lugar que ele comandou uma espedição',
      'options': [
        'Para o Leste (Rus e Kiev)',
        'Para o Oeste (Inglaterra)',
        'Para o Sul (França)',
        'Para o Sudeste (Arábia Saudita e Egito)'],
      'answer': 1,
      'image': 'https://aventurasnahistoria.com.br/media/uploads/legacy/2017/03/28/originalviingf-q8092e9d83.jpeg '
    },
    {
      'question': 'Qual e o nome do primeiro filho home de Ragnar?',
      'options': ['Rollo', 'Erick', 'Bjorn', 'Harald'],
      'answer': 2,
      'image': 'https://i.pinimg.com/originals/2e/33/27/2e3327b1d69c0d4c3c5446a075db9d23.jpg'
    },
    {
      'question': 'De qual maneira a filha de Ragnar, Gyda morre?',
      'options': ['Doença', 'Assassinada', 'Em parto', 'Afogada'],
      'answer': 0,
      'image':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJXWaB5MAC6GXOGWEGjcDvOzEt9oi7KislIg&s'
    },
    {
      'question':
          'Qual é a famosa cidade que os vikings atacam em uma de suas principais invasões?',
      'options': ['Paris', 'Roma', 'Constantinopla', 'Atenas'],
      'answer': 0,
      'image': 'https://imgix.ranker.com/list_img_v2/16605/2776605/original/real-vikings-paris-siege-facts'
    },
    {
      'question': 'Qual e o nome da segunda esposa de Ragnar segundo a série',
      'options': ['Tora Borgarhjort', 'Aslauga', 'Astrid', 'Yidu'],
      'answer': 1,
      'image': 'https://static.wikia.nocookie.net/vikings/images/e/e5/Aslaug.png/revision/latest?cb=20170308010317&path-prefix=pt-br'
    },
    {
      'question':
          'Quem é o monge que se torna amigo de Ragnar e acaba servindo como conselheiro?',
      'options': ['Hvitserk', 'Floki', 'Athelstan', 'Ubba'],
      'answer': 2,
      'image': ' '
    },
    {
      'question':
          'O que faz Ivar, o Desossado, ser uma figura temida na série?',
      'options': [
        'Ele é imune à dor',
        'Ele conquista toda a Escandinávia sozinho',
        ' Ele é um grande estrategista e guerreiro',
        'Por conquistar Londres'],
      'answer': 2,
      'image': 'https://conteudo.imguol.com.br/c/entretenimento/bc/2019/07/23/alex-hgh-andersen-em-cena-de-vikings-1563910271155_v2_4x3.png '
    },
    {
      'question': 'Qual e o maior medo de Ivar?',
      'options': [
        'Ser rejeitado por sua deficiência física',
        'Perder sua habilidade de lutar',
        'Não ser reconhecido como líder',
        'Ser superado por seus irmãos'],
      'answer': 0,
      'image': 'https://farofageek.com.br/wp-content/uploads/2020/02/ivar11-800x445.jpg '
    }   
  ];

  void _startQuiz() {
    setState(() {
      _quizStarted = true;
      _quizCompleted = false;
      _score = 0;
      _currentQuestionIndex = 0;
      _feedbackMessage = '';
    });
  }

  void _resetQuiz() {
    setState(() {
      _quizStarted = false;
      _quizCompleted = false;
      _score = 0;
      _currentQuestionIndex = 0;
      _feedbackMessage = '';
    });
  }

  void _answerQuestion(int selectedOption) {
    bool isCorrect =
        selectedOption == _questions[_currentQuestionIndex]['answer'];
    setState(() {
      if (isCorrect) {
        _score++;
        _feedbackMessage = 'Verdadeiro! Você acertou.';
      } else {
        _feedbackMessage = 'Falso! Você errou.';
      }
      _currentQuestionIndex++;
    });

    if (_currentQuestionIndex >= _questions.length) {
      setState(() {
        _quizCompleted = true;
      });
    }
  }

  Widget _buildStartPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            '',
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _startQuiz,
            child: Text('Começar o Quiz', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizQuestion() {
    final question = _questions[_currentQuestionIndex];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pergunta ${_currentQuestionIndex + 1} de ${_questions.length}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          Text(
            question['question'],
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ...List.generate(question['options'].length, (index) {
            return ElevatedButton(
              onPressed: () => _answerQuestion(index),
              child: Text(question['options'][index]),
            );
          }),
          SizedBox(height: 20),
          if (_feedbackMessage.isNotEmpty)
            Text(
              _feedbackMessage,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: _feedbackMessage.contains('Verdadeiro')
                      ? Colors.green
                      : Colors.red),
            ),
        ],
      ),
    );
  }

  Widget _buildFinalScreen() {
    final int totalQuestions = _questions.length;
    final double percentage = (_score / totalQuestions) * 100;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Parabéns! Você completou o quiz.',
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            'Sua Pontuação: $_score de $totalQuestions',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'Desempenho: ${percentage.toStringAsFixed(1)}%',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _resetQuiz,
            child: Text('Tentar Novamente', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: _quizStarted
          ? _quizCompleted
              ? _buildFinalScreen()
              : _buildQuizQuestion()
          : _buildStartPage(),
    );
  }
}
