import 'dart:io';
import 'dart:core';

class Stopwatch {
  DateTime? startTime;
  Duration passedTime = Duration.zero;

  void start(){
    startTime = DateTime.now();
    print('stopwatch started');
  }

  void stop(){
    if(startTime==null){
      print('press S to start.');
    }else{
      passedTime += DateTime.now().difference(startTime!);
      print("${passedTime.inHours}h${passedTime.inMinutes}m${passedTime.inSeconds}s\nenter \'s\' to restart.");
    }
  }

  void reset(){
    passedTime = Duration.zero;
    print('stopwatch reset');
  }
}

class StopwatchManager{
  void Instruction(){
    print('input \'s\' to start, \'e\' to stop, and \'r\' to reset the timer.');
  }
  void Supervise(){
    final stopwatch = Stopwatch();
    while(true){
      switch(stdin.readLineSync()){
        case 's':
          stopwatch.start();
        case 'e':
          stopwatch.stop();
        case 'r':
          stopwatch.reset();
        default :
          print('Invalid input. Enter \'s\' to start.');
      }
    }
  }
}

void main() {
  final manager = StopwatchManager();
  manager.Instruction();
  manager.Supervise();
}

