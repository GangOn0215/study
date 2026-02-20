package a07_class_inheritance;

public class Main {
    public static void main(String[] args) {
        Employee emp = new Employee("김철", 30, "Dev", "Back Dev");

        emp.sayIntroduce();
        emp.work();
    }
}
