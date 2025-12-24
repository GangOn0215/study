package a07_class;

public class A_main {
    public static void main(String[] args) {
        // 하드코딩
        String student1Name = "학생 1";
        int student1Age = 25;
        int student1Grade = 50;

        String student2Name = "학생 2";
        int student2Age = 25;
        int student2Grade = 50;

        String[] studentName = { "학생 1", "학생 2", "학생 3" };
        int[] studentAge = { 25, 50, 60 };
        int[] studentGrade = { 50, 70, 20 };

        // 클래스 활용

        Student st1 = new Student(50, 60, "ho");

        // st1.setAge(20);
        // st1.setGrade(80);
        // st1.setName("Nico");

        System.out.println(st1);
    }
}
