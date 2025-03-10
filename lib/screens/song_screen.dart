import 'package:flutter/material.dart';
import 'package:Bassify/screens/home_screen.dart'; // Импортируем HomeScreen
import 'package:Bassify/screens/equalizer_screen.dart'; // Импортируем EqualizerScreen
import 'package:Bassify/screens/library_screen.dart'; // Импортируем LibraryScreen
import 'package:audioplayers/audioplayers.dart';

class SongPage extends StatefulWidget {
  final String songTitle; // Название трека
  final String artist; // Исполнитель
  final String imageUrl; // URL изображения (если есть)
  final Duration duration; // Длительность трека

  const SongPage({
    Key? key,
    required this.songTi  tle,
    required this.artist,
    this.imageUrl = 'assets/images/song_image.png', // Дефолтное изображение
    this.duration =
        const Duration(minutes: 3, seconds: 46), // Дефолтная длительность
  }) : super(key: key);

  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }
  

  Future setAudio() async {
    final player = AudioCache(prefix: 'assets/images/');
    final url = await player.load('${widget.songTitle}.mp3');
    await audioPlayer.setSourceDeviceFile(url.path);
  }

  Duration currentPosition =
      const Duration(minutes: 1, seconds: 28); // Текущее время трека
  bool isShuffleActive = false;
  bool isRepeatActive = false;
  int _selectedIndex = 0; // Индекс выбранной страницы

  void togglePlayPause() async {
    if (isPlaying) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.resume();
    }
    // setState(() {
    //   isPlaying = !isPlaying;
    // });
  }

  void updateCurrentPosition(Duration newPosition) {
    setState(() {
      currentPosition = newPosition;
    });
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes);
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  // Метод для обработки нажатий на BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Навигация на соответствующую страницу
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const EqualizerScreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LibraryScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Фиксированные размеры для имитации экрана телефона
    double phoneWidth = 412;
    double phoneHeight = 917;

    return Scaffold(
      backgroundColor: const Color(0xFF1D1B29), // Фон как на home_page
      body: Center(
        child: Container(
          width: phoneWidth,
          height: phoneHeight,
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: const Color(0xFF1D1B29),
                appBar: AppBar(
                  backgroundColor: const Color(0xFF1D1B29),
                  elevation: 0,
                  leading: IconButton(
                    icon: Image.asset('assets/images/arrow_back_icon.png',
                        color: Colors.white), // Кастомная иконка
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                      top: 30,
                      left: 24,
                      right: 24,
                      bottom: 16), // Сдвиг вниз на 30 пикселей
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Область под картинку
                      Center(
                        child: Container(
                          width: 360, // Ширина области
                          height: 360, // Высота области
                          decoration: BoxDecoration(
                            color: Colors.white
                                .withOpacity(0.1), // Фон, если картинки нет
                            borderRadius:
                                BorderRadius.circular(16), // Закругленные углы
                            image: DecorationImage(
                              image: AssetImage(widget
                                  .imageUrl), // Используем переданное изображение
                              fit: BoxFit
                                  .cover, // Изображение заполняет контейнер
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons
                                  .music_note, // Стандартная иконка, если картинки нет
                              size: 100,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24), // Отступ как на home_page

                      // Название трека и исполнитель
                      Text(
                        widget.songTitle, // Используем переданное название
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8), // Отступ
                      Text(
                        widget.artist, // Используем переданного исполнителя
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'OpenSans',
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(
                          height: 30), // Увеличенный отступ до линии прогресса

                      Slider(
                        min: 0,
                        max: duration.inSeconds.toDouble(),
                        value: position.inSeconds.toDouble(),
                        onChanged: (value) async {
                          final position = Duration(seconds: value.toInt());
                          await audioPlayer.seek(position);

                          await audioPlayer.resume();
                        },
                      ),

                      // Padding(
                      //     padding: const EdgeInsets.symmetric(horizontal: 16),
                      //     child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Text(formatDuration(position)),
                      //           Text(formatDuration(duration))
                      //         ])),

                      // // Линия прогресса
                      // LinearProgressIndicator(
                      //   value: currentPosition.inSeconds /
                      //       widget.duration.inSeconds,
                      //   backgroundColor: Colors.white.withOpacity(0.1),
                      //   valueColor:
                      //       const AlwaysStoppedAnimation<Color>(Colors.white),
                      // ),
                      // const SizedBox(
                      //     height: 8), // Отступ между линией и цифрами времени

                      // Время трека (под линией)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formatDuration(position), // Текущее время
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'OpenSans',
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            formatDuration(
                                duration), // Используем переданную длительность
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'OpenSans',
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                          height:
                              40), // Увеличенный отступ до иконок управления

                      // Иконки управления воспроизведением
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Иконка "перемешать" слева
                          IconButton(
                            icon: Image.asset(
                              'assets/images/shuffle_icon.png',
                              color: isShuffleActive
                                  ? const Color(0xFF6200EE)
                                  : Colors.white, // Фиолетовый, если активно
                            ),
                            onPressed: () {
                              setState(() {
                                isShuffleActive =
                                    !isShuffleActive; // Переключение состояния
                              });
                            },
                          ),
                          // Центральные иконки: назад, пуск/пауза, вперед
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Image.asset(
                                    'assets/images/previous_icon.png',
                                    color: Colors.white),
                                onPressed: () {
                                  // Действие для перехода к предыдущему треку
                                },
                              ),
                              IconButton(
                                icon: isPlaying
                                    ? Image.asset(
                                        'assets/images/pause_icon.png')
                                    : Image.asset(
                                        'assets/images/play_icon.png'),
                                onPressed: togglePlayPause,
                              ),
                              IconButton(
                                icon: Image.asset('assets/images/next_icon.png',
                                    color: Colors.white),
                                onPressed: () {
                                  // Действие для перехода к следующему треку
                                },
                              ),
                            ],
                          ),
                          // Иконка "повтор" справа
                          IconButton(
                            icon: Image.asset(
                              'assets/images/repeat_icon.png',
                              color: isRepeatActive
                                  ? const Color(0xFF6200EE)
                                  : Colors.white, // Фиолетовый, если активно
                            ),
                            onPressed: () {
                              setState(() {
                                isRepeatActive =
                                    !isRepeatActive; // Переключение состояния
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Полупрозрачный BottomNavigationBar
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black
                        .withOpacity(0.5), // Полупрозрачный черный фон
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.transparent, // Прозрачный фон
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/images/home_icon.png'),
                          size: 24,
                          color:
                              Color(0xFF6200EE), // Цвет иконки (непрозрачный)
                        ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/images/equalizer_icon.png'),
                          size: 24,
                          color: Colors.white, // Цвет иконки (непрозрачный)
                        ),
                        label: 'Equalizer',
                      ),
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/images/library_icon.png'),
                          size: 24,
                          color: Colors.white, // Цвет иконки (непрозрачный)
                        ),
                        label: 'Library',
                      ),
                    ],
                    currentIndex: _selectedIndex, // Активная иконка
                    selectedItemColor: const Color(
                        0xFF6200EE), // Цвет выбранной иконки (непрозрачный)
                    unselectedItemColor: Colors
                        .white54, // Цвет невыбранной иконки (полупрозрачный)
                    onTap: _onItemTapped, // Обработка нажатий
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



}
