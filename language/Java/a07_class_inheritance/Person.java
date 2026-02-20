package a07_class_inheritance;

// 부모 클래스
public class Person {
    protected String name;
    protected int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public void sayIntroduce() {
        System.out.println("Hi " + this.name + "입니다. " + this.age + " 살 입니다");
    }
}
