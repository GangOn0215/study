package a04_array;

public class a_array {
    public static void main(String[] args) {
        int[] students = new int[5];


        for(int i = 0; i < students.length; i++){
            students[i] = i+1;
        }

        System.out.println(students[0]);

    }
}
