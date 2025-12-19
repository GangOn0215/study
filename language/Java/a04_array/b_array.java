package a04_array;

public class b_array {
    public static void main(String[] args) {
        int[] students = new int[] {90, 80, 70, 60, 50};
        // int[] students;
        // students = {90, 80, 70, 60, 50};    << 이건 안댐
        for(int i = 0; i < students.length; i++){
            System.out.println(students[i]);
        }
    }
}
