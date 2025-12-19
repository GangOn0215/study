package a03_conditional;

public class b_switch {
    public static void main(String[] args) {
        int grade = 1;

        // Java 14에서 돌아가는
        int coupon = switch (grade) {
            case 1 -> 1000;
            case 2 -> 2000;
            case 3 -> 3000;
            case 4 -> 4000;
            default -> 500;
        };

        System.out.println(coupon);
    }
}
