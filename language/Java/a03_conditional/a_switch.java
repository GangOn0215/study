package a03_conditional;

public class a_switch {
    public static void main(String[] args) {
        int grade = 1;

        int coupon;

        switch (grade) {
            case 1:
                coupon = 1000;
                break;
            case 2:
                coupon = 2000;
                break;
            case 3:
                coupon = 3000;
                break;
            case 4:
                coupon = 4000;
                break;
            default:
                coupon = 500;
                break;

        }
    }
}
