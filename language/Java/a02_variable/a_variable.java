package a02_variable;

public class a_variable {
    public static void main(String[] args) {
        int a = 10;
        a = 20;

        System.out.println(a);

        int b, c;
        b = 10;
        c = 20;

        System.out.println(b + c);

        int aa = 100;
        double bb = 10.5;
        boolean cc = true;
        char dd = 'A';
        String e = "Hello";

        /*
            변수 자료형
                - int ( 자료형 )
                - double ( 실수 )
                - boolean ( 불리언 )
                - char ( 문자 )
                - String ( 문자열 )

            위 처럼 대입하는 데이터들 ( 100, true, "Hello" ) 이런 값들을 "리터럴(literal)" 이라고 부른다.

            리터럴(literal) 는 개발자가 직접 입력한 고정된 값.

         */



        System.out.println(aa);
        System.out.println(bb);
        System.out.println(cc);
        System.out.println(dd);
        System.out.println(e);
    }
}
