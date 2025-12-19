package a06_method;

public class Method1 {
    public static void main(String[] args) {
        int sum1 = add(1, 2);
        int sub1 = sub(1, 2);

        System.out.println(sum1);
        System.out.println(sub1);
    }

    public static int add(int a, int b) {
        return a + b;
    }

    public static int sub(int a, int b) {
        return a - b;
    }
}
