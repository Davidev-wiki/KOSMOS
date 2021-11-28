package com.kosmos.common;

public class CommonUtils {

	private static final String[] grade_value = {"1", "2", "3", "전"};
	private static final String[] day_value = {"월", "화", "수", "목", "금"};
	private static final String[] time_value = {"1", "2", "3", "4", "5", "6", "7", "8"};
	
	
	// 학년들 : 화면에 표현 후 > DB로 보냄
	// 일시적으로 DB에서 검색하는 숫자 맞추기 위해 "전"학년(공통과목)을 4학년으로 표시하게 해둡니다.  
	public static String grades() {
		String s = "";
		int glen = grade_value.length;
		
		for (int j=0; j < glen; j++) {
			if (j < glen) {
				s += grade_value[j] + ",";	
				System.out.println("s >>> : " + s);
			}
		}
		return s;
	}
	
	// [ 현재 사용 안 하는 코드 ]
	//  학년 : DB에서 data 1개를 숫자로 받았을 때, 화면에 표현되는 값으로 바꿔주기 위한 과정
	//	s = 1 > g = grade_value[0]
	//	s = 4 > g = grade_value[4-1]
//	public static String gradeDBToFront(String s) {
//		String g = "";
//		int to_num;
//		to_num = Integer.parseInt(s);
//		System.out.println("s >>> : " + s);
//		System.out.println("to_num >>>> : " + to_num);
//		
//		if (s.equals(Integer.toString(to_num))) {
//			g += grade_value[to_num-1];
//		}
//			System.out.println("g >>> : " + g);
//		return g;
//	}
	
	// [ 현재 사용 안 하는 코드 ] 
	// 학년들 : 배열에 있는 한글로 바꿔주는 역할
		//	s = 1 > g = grade_value[0]
		//	s = 4 > g = grade_value[4-1]
//		public static String grades(int i) {
//			String g = "";
//			
//			if (i > 0) {
//				g += grade_value[i-1];
//				System.out.println("g >>> : " + g);
//			}
//			return g;
//		}
	
	// 요일 : 화면에 표현만 하는 역할
	public static String days() {
		String s = "";
		int dlen = day_value.length;
		
		for (int j=0; j < dlen; j++) {
			if (j < dlen) {
				s += day_value[j] + ",";	
				System.out.println("s >>> : " + s);
			}
		}
		return s;
	}
	
	
	// 학년들 : 화면에 표현만 하는 역할
	public static String times() {
		String s = "";
		int glen = time_value.length;
		
		for (int j=0; j < glen; j++) {
			if (j < glen) {
				
				s += time_value[j] + ",";	
				System.out.println("s >>> : " + s);
			}
		}
		return s;
	}
		
	public static void main(String[] args) {
		
		CommonUtils.grades();
//		System.out.println("CommonUtils test >>> : " + CommonUtils.grades_test("4"));
//		CommonUtils.day();
	}
}
