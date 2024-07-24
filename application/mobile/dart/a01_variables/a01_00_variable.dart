// 지역변수인 경우 보통 var을 사용한다.

var name = 'BOB';

String strName = 'BOB';

/**
 * Object is a generic type that can be used to store any data type.
 */
Object objName = 'BOB';

// ? 를 넣어줘야 null을 허용한다.
int? lineCount;

int lineCountNotNull = 0;

// late 키워드를 사용하면 나중에 초기화 할 수 있다.
late String description;

/**
 * 위에서 변수만 배웠다면 이제 상수를 배운다.
 */

final finalName = 'Pro';
final String nickname = 'proABobby';

const pi = 3.14;

/**
 * final vs const
 * 
 * final: 인스턴스 변수 가 될 수 있다.
 * const: 인스턴스 변수 가 될 수 없다.
 * 
 * 인스턴스 변수는 무엇인가?
 * 
 * 클래스 내에서 사용하는 변수를 인스턴스 변수라고 합니다.
 * 클래스 내에서 사용하는 변수 이면서 
 * 
 * class test {
 *    int a; // 인스턴스 변수
 *    static int b; // 클래스 변수
 * }
 * 
 */

void main() {
  // dynamic 은 비추
  dynamic dName = 'ab';

  if (dName is String) {
    dName.isEmpty;
  }

  if (dName is int) {
    print(dName.isEven);
  }
}

bool isEmpty(String string) => string.length == 0;
