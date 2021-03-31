import 'package:petitparser/petitparser.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math' as math;



abstract class Parser {
  final bool isRadMode;
  final String inputString;
  List _outputStack = [];
  List _operStack = [];
  List _stream = [];

  Parser(this.inputString, this.isRadMode);

  /// 1. Tokenize input string
  /// 2. Shunting yard
  void tokenize();
  void shuntingyard();
  parse();

}

class LaTexParser extends Parser {
  final String inputString;
  final bool isRadMode;

  LaTexParser(this.inputString, {this.isRadMode = true}) : super(inputString, isRadMode);

  @override
  void tokenize() {
    /// types:
    /// b -> basic
    /// f -> function
    /// l -> left parenthesis
    /// r -> right parenthesis
    /// o+digit+(l) -> operator + precedence + (left-associativity)
    /// u -> other
    final integer = digit().plus().flatten();
    final number =
    ((integer | char('.').and()) &
    (char('.') & integer).pick(1).optional() &
    (char('E') & pattern('+-').optional() & integer).optional()).flatten().map(num.parse);

    final pi = string('\\pi').map((a)=>math.pi);
    final e = char('e').map((a)=>math.e);
    final variable = pattern('xy');

    final basic = (number | pi | e | variable).map((v)=>[v, 'b']);

    final sqrt = (string('\\sqrt') & char('{').and()).map((v)=>['\\sqrt', 'f']);
    final nrt = (string('\\sqrt') & char('[').and()).map((v)=>['\\nrt', 'f']);
    final simplefunction =
    (((string('\\sin')  |  string('\\sec') | string('\\csc') | string('\\cot') | string('\\cos') | string('\\tan') | string('\\arcsin') | string('\\arccos') | string('\\arctan')  | string('\\operatorname{arcsec}') | string('\\operatorname{arccsc}') | string('\\operatorname{arccot}') | string('\\ln')) & string('\\left(').and()).pick(0).map((v)=>[v, 'f']));
    final otherfunction = (string('\\frac')| string("\\log") ).map((v)=>[v, 'f']);
    final function =
    simplefunction | otherfunction | sqrt | nrt ;

    final lp = (string('\\left(') | char('{') | string('(') | char('[')).map((v)=>[v, 'l']);

    final rp = (string('\\right)') | char('}') | string('(') | char(']')).map((v)=>[v, 'r']);

    final plus = char('+').map((v)=>[v, ['o', 2, 'l']]);

    final minus = char('-').map((v)=>[v, ['o', 2, 'l']]);

    final times = string('\\times').map((v)=>[v, ['o', 3, 'l']]);

    final divide = string('\\div').map((v)=>[v, ['o', 3, 'l']]);

    final expo = char('^').map((v)=>[v, ['o', 4, 'r']]);

    final factorial = char('!').map((v)=>[v, ['o', 5, 'l']]);

    final percent = string('\\%').map((v)=>[v, ['o', 5, 'l']]);

    final oper = plus | minus | times | divide | expo | factorial | percent;

    final subnumber = (char('_') & digit().map(int.parse)).pick(1);

    final underline = char('_');

    final other = (subnumber | underline).map((v)=>[v, 'u']);

    final tokenize = (basic | function | lp | rp | oper | other).star().end();

    _stream = tokenize.parse(inputString).value;

    if (_stream[0][0]=='-' && _stream[1][1].contains(RegExp(r'[bfl]'))) {
      _stream.insert(0, [0, 'b']);
    }
    if (_stream[0][0]=='!') {
      throw 'Unable to parse';
    }

    for (var i = 0; i < _stream.length; i++) {
      /// wrong syntax: fr fo lr lo oo (b/r postfix or wrong)
      /// need times: bb bf bl rb rf !f !l
      /// negative number: -(bfl) / l-(bfl)

      // negative number
      if (i>0 && i<_stream.length-1 && _stream[i-1][1]=='l' && _stream[i][0]=='-' && _stream[i+1][1].contains(RegExp(r'[bfl]'))) {
        _stream.insert(i, [0, 'b']);
        i++;
        continue;
      }

      // add ×
      if (i<_stream.length-1 && _stream[i][1]=='b') {
        switch (_stream[i+1][1]) {
          case 'b':
          case 'f':
          case 'l':
            _stream.insert(i+1, ['\\times', ['o', 3, 'l']]);
            i++;
            break;
          default:
            break;
        }
        continue;
      }
      if (i<_stream.length-1 && _stream[i][1]=='r') {
        switch (_stream[i+1][1]) {
          case 'b':
          case 'f':
            _stream.insert(i+1, ['\\times', ['o', 3, 'l']]);
            i++;
            break;
          default:
            break;
        }
        continue;
      }
      if (i<_stream.length-1 && _stream[i][0]=='!') {
        switch (_stream[i+1][1]) {
          case 'l':
          case 'f':
            _stream.insert(i+1, ['\\times', ['o', 3, 'l']]);
            i++;
            break;
          default:
            break;
        }
        continue;
      }

      // check wrong syntax
      if (i>0 && (_stream[i][1]=='r' || _stream[i][1] is List)) {
        if (_stream[i-1][1] is List && _stream[i-1][1][1]!=5) {
          throw 'Unable to parse';
        }
        switch (_stream[i-1][1]) {
          case 'l':
          case 'f':
            throw 'Unable to parse';
          default:
            break;
        }
        continue;
      }
    }
  }

  @override
  void shuntingyard() {
    for (var i = 0; i < _stream.length; i++) {
      switch (_stream[i][1]) {
        case 'b':
          _outputStack.add(_stream[i][0]);
          break;
        case 'f':
          _operStack.add(_stream[i]);
          break;
        case 'l':
          if (_stream[i][0]=='\\left|') {
            _operStack.add(['\\abs', 'f']);
          }
          _operStack.add(_stream[i]);
          break;
        case 'r':
          while (true) {
            if (_operStack.length<=0) {
              break;
            }
            if (_operStack.last[1]!='l') {
              _outputStack.add(_operStack.last[0]);
              _operStack.removeLast();
              continue;
            } else {
              _operStack.removeLast();
            }
            break;
          }
          break;
        case 'u':
          if (_stream[i][0] is num) {
            _outputStack.add(_stream[i][0]);
          }
          break;
        default:
          while (true) {
            if (_operStack.length<=0) {
              break;
            }
            if (_operStack.last[1]=='f') {
              _outputStack.add(_operStack.last[0]);
              _operStack.removeLast();
              continue;
            }
            if (_operStack.last[1] is List) {
              if (_operStack.last[1][1] > _stream[i][1][1]) {
                _outputStack.add(_operStack.last[0]);
                _operStack.removeLast();
                continue;
              } else if (_operStack.last[1][1] == _stream[i][1][1] && _operStack.last[1][2] == 'l') {
                _outputStack.add(_operStack.last[0]);
                _operStack.removeLast();
                continue;
              }
            }
            break;
          }
          _operStack.add(_stream[i]);
      }
    }
    while (_operStack.length>0) {
      _outputStack.add(_operStack.last[0]);
      _operStack.removeLast();
    }
  }

  @override
  Expression parse() {
    tokenize();
    shuntingyard();
    List<Expression> result = <Expression>[];
    Expression left;
    Expression right;
    for (var i = 0; i < _outputStack.length; i++) {
      switch (_outputStack[i]) {
        case '+':
          right = result.removeLast();
          left = result.removeLast();
          result.add(left + right);
          break;
        case '-':
          right = result.removeLast();
          left = result.removeLast();
          result.add(left - right);
          break;
        case '\\times':
          right = result.removeLast();
          left = result.removeLast();
          result.add(left * right);
          break;
        case '\\div':
          right = result.removeLast();
          left = result.removeLast();
          result.add(left / right);
          break;
        case '\\frac':
          right = result.removeLast();
          left = result.removeLast();
          result.add(left / right);
          break;
        case '^':
          right = result.removeLast();
          left = result.removeLast();
          result.add(left ^ right);
          break;
        case '\\sin':
          if (isRadMode) {
            result.add(Sin(result.removeLast()));
          } else {
            result.add(Sin(result.removeLast() * Number(math.pi / 180)));
          }
          break;
        case '\\cos':
          if (isRadMode) {
            result.add(Cos(result.removeLast()));
          } else {
            result.add(Cos(result.removeLast() * Number(math.pi / 180)));
          }
          break;
        case '\\tan':
          if (isRadMode) {
            result.add(Tan(result.removeLast()));
          } else {
            result.add(Tan(result.removeLast() * Number(math.pi / 180)));
          }
          break;
        case '\\sec':
          if (isRadMode) {
            result.add(Sec(result.removeLast()));
          } else {
            result.add(Sec(result.removeLast() * Number(math.pi / 180)));
          }
          break;
        case '\\csc':
          if (isRadMode) {
            result.add(Csc(result.removeLast()));
          } else {
            result.add(Csc(result.removeLast() * Number(math.pi / 180)));
          }
          break;
        case '\\cot':
          if (isRadMode) {
            result.add(Cot(result.removeLast()));
          } else {
            result.add(Cot(result.removeLast() * Number(math.pi / 180)));
          }
          break;
        case '\\arcsin':
          if (isRadMode) {
            result.add(Asin(result.removeLast()));
          } else {
            result.add(Asin(result.removeLast()) * Number(180 / math.pi));
          }
          break;
        case '\\arccos':
          if (isRadMode) {
            result.add(Acos(result.removeLast()));
          } else {
            result.add(Acos(result.removeLast()) * Number(180 / math.pi));
          }
          break;
        case '\\arctan':
          if (isRadMode) {
            result.add(Atan(result.removeLast()));
          } else {
            result.add(Atan(result.removeLast()) * Number(180 / math.pi));
          }
          break;
        case '\\operatorname{arccsc}':
          if (isRadMode) {
            result.add(Acsc(result.removeLast()));
          } else {
            result.add(Acsc(result.removeLast()) * Number(180 / math.pi));
          }
          break;
        case '\\operatorname{arcsec}':
          if (isRadMode) {
            result.add(Asec(result.removeLast()));
          } else {
            result.add(Asec(result.removeLast()) * Number(180 / math.pi));
          }
          break;
        case '\\operatorname{arccot}':
          if (isRadMode) {
            result.add(Acot(result.removeLast()));
          } else {
            result.add(Acot(result.removeLast()) * Number(180 / math.pi));
          }
          break;
        case '\\ln':
          result.add(Ln(result.removeLast()));
          break;
        case '\\log':
          right = result.removeLast();
          left = result.removeLast();
          result.add(Log(left, right));
          break;
        case '\\sqrt':
          result.add(Root.sqrt(result.removeLast()));
          break;
        case '\\nrt':
          left = result.removeLast();
          right = result.removeLast();
          result.add(left ^ (Number(1.0) / right));
          break;
        case '\\abs':
          result.add(Abs(result.removeLast()));
          break;
        case '!':
          try {
            num t = result.removeLast().evaluate(
                EvaluationType.REAL, ContextModel());
            if (t.ceil() == t.floor() && t >= 0 && t < 20) {
              int a = t.toInt();
              int y = 1;
              while (a > 0) {
                y *= a;
                a--;
              }
              result.add(Number(y));
            } else {
              throw 'Unable to do factorial';
            }
          } catch (e) {}
          break;
        default:
          if (_outputStack[i] is String) {
            result.add(Variable(_outputStack[i]));
          } else {
            result.add(Number(_outputStack[i]));
          }
      }
    }
   if (result.length == 1) {
        return result[0];
    }
   else {
      throw 'Parse Error';
          }
      }

}


