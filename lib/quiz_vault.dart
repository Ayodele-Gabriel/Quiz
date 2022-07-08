import 'package:quiz/inquiry.dart';

class QuizVault {
  int _inquiryStage = 0;

  final List<Inquiries> _inquiryBase = [
    Inquiries('Some cats are actually allergic to humans', true),
    Inquiries('You can lead a cow down stairs but not up stairs.', false),
    Inquiries(
        'Approximately one quarter of human bones are in the feet.', true),
    Inquiries('A slug\'s blood is green.', true),
    Inquiries('Buzz Aldrin\'s mother\'s maiden name was "Moon".', true),
    Inquiries('It is illegal to pee in the Ocean in Portugal.', true),
    Inquiries(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Inquiries(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Inquiries(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Inquiries(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Inquiries('Google was originally called "Backrub".', true),
    Inquiries(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Inquiries(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  void otherInquiry() {
    if (_inquiryStage < _inquiryBase.length - 1) {
      _inquiryStage++;
    }
  }

  String findInquiryLetters() {
    return _inquiryBase[_inquiryStage].inquiryLetters;
  }

  bool findInquiryReply() {
    return _inquiryBase[_inquiryStage].inquiryReply;
  }

  bool theEnd() {
    if (_inquiryStage >= _inquiryBase.length - 1) {
      print('Correct');
      return true;
    } else {
      return false;
    }
  }

  void startOver() {
    _inquiryStage = 0;
  }
}