package a05_loop;

public class A_EnhanceFor {
    public static void main(String[] args) {
        int[] numbers = { 1, 2, 3, 4, 5 };

        for(int i = 0; i < numbers.length; i++){
            int number = numbers[i];

            System.out.println(number);
        }

        for(int number: numbers) {
            System.out.println(number);
        }

        String[] students = { "a", "b", "c", "d", "e" };
        // iter 만 써도 자동으로 향상된 for을 만들어줌.
        for (String student : students) {
            System.out.println(student);
        }

    }
}
