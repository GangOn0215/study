package a07_class_inheritance;

public class Manager extends Employee {
    private final int teamSize;

    public Manager(String name, int age, String depart, String position, int teamSize) {
        super(name, age, depart, position);
        this.teamSize = teamSize;
    }

    @Override
    public void work() {
        super.work();

        System.out.println(teamSize + " 명의 팀원을 관리 중 입니다.");
    }
}
