package a07_class_inheritance;

// 자식 클래스
public class Employee extends Person {
    private final String depart; // 팀
    private final String position; // 직무

    public Employee(String name, int age, String depart, String position) {
        super(name, age); // 부모클래스를 참조

        this.depart = depart;
        this.position = position;
    }

    public void work() {
        System.out.println(this.name + " 님이 " + this.depart + " Team 에서 근무 중 입니다, " + this.position + " 입니다." );
    }
}
