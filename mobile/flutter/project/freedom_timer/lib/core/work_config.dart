class WorkConfig {
  int startHour; // 출근 시간
  int startMinute; // 출근 분
  int endHour; // 퇴근 시간
  int endMinute; // 퇴근 분

  WorkConfig({
    this.startHour = 9,
    this.startMinute = 0,
    this.endHour = 18,
    this.endMinute = 0,
  });

  // 싱글톤 의 방식
  // 제일 많이 쓰는 패턴 이기도 함

  // 싱글톤을 쓰는 이유: 전역 변수로 쓰면서 다른곳에선 다시 선언 하지 않도록 하기 위함.
  static final WorkConfig instance = WorkConfig();

  DateTime todayStart(DateTime now) =>
      DateTime(now.year, now.month, startHour, 0);
}
