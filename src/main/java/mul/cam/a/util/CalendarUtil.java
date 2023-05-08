package mul.cam.a.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

// import dto.CalendarDto;

public class CalendarUtil {
	
	// 문자열검사 : 빈문자->true
	public static boolean nvl(String msg) {
		return msg==null||msg.trim().equals("") ? true : false;
	}
	
	// 한자리 숫자를 두자리로 만들어 주는 함수 :
	public static String two(String msg) {
		return msg.trim().length()<2 ? "0"+msg.trim() : msg.trim();
	}
	
	// 문장이 길 경우 단락으로 처리하는 함수
	public static String dot3(String msg) {
		String str = "";
		if(msg.length() >= 10) {
			str = msg.substring(0,10);
			str += "...";
		}else {
			str = msg.trim();
		}
		return str;
	}
	
	// 날짜를 출력이 보기 좋게 하는 함수
	public static String toDates(String mdate) {
		
		// 날짜 형식
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분");
		
		// 202302170942 -> yyyy-MM-dd hh:mm
		String s = mdate.substring(0, 4) + "-"		// yyyy
					+ mdate.substring(4, 6) + "-"	// MM
					+ mdate.substring(6, 8) + " "	// dd
					+ mdate.substring(8, 10) + ":"	// hh
					+ mdate.substring(10) + ":00";	// mm		
		Timestamp d = Timestamp.valueOf(s);
		
		return sdf.format(d);
	}		
	
	// 앞에 0이 있는 문자열을 한자리 변환  08 -> 8	
	public static String toOne(String msg) {
		return msg.charAt(0)=='0'?msg.charAt(1)+"":msg;
	}	
}
