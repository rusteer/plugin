package net.workspace.web.web;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.zip.GZIPOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.workspace.web.util.ParseKsy;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;

public class WebUtil {
    public static long getBusinessSecondsBetween(Date time1, Date time2, long startHour, long endHour) {
        long freeHours = 24 - (endHour - startHour + 1);
        Calendar lastTime = Calendar.getInstance();
        lastTime.setTime(time1);
        int passedDays = getDaysBetween(lastTime, Calendar.getInstance());
        return (time2.getTime() - lastTime.getTimeInMillis() - passedDays * freeHours * 3600 * 1000) / 1000;
    }
    public static int getDaysBetween(Calendar d1, Calendar d2) {
        if (d1.after(d2)) { // swap dates so that d1 is start and d2 is end
            Calendar swap = d1;
            d1 = d2;
            d2 = swap;
        }
        int days = d2.get(Calendar.DAY_OF_YEAR) - d1.get(Calendar.DAY_OF_YEAR);
        int y2 = d2.get(Calendar.YEAR);
        if (d1.get(Calendar.YEAR) != y2) {
            d1 = (Calendar) d1.clone();
            do {
                days += d1.getActualMaximum(Calendar.DAY_OF_YEAR);//得到当年的实际天数
                d1.add(Calendar.YEAR, 1);
            } while (d1.get(Calendar.YEAR) != y2);
        }
        return days;
    }
    public static String getRequestIp(HttpServletRequest request) {
        String ip = request.getHeader("X-Real-IP");
        if (StringUtils.isEmpty(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }
    public static void write(HttpServletRequest request, HttpServletResponse response, Object obj2) {
        if (obj2 != null) {
            String s = obj2.toString();
            PrintWriter out = null;
            response.setHeader("Content-Encoding", "gzip");
            try {
                out = new PrintWriter(new GZIPOutputStream(response.getOutputStream()));
                out.write(s);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (out != null) out.close();
            }
        }
    }
    public static long getLongParameter(HttpServletRequest request, String name) {
        long result = 0;
        try {
            result = Long.valueOf(request.getParameter(name));
        } catch (Exception e) {}
        return result;
    }
    public static int getIntParameter(HttpServletRequest request, String name) {
        int result = 0;
        try {
            result = Integer.valueOf(request.getParameter(name));
        } catch (Exception e) {}
        return result;
    }
    public static int getIntParameter(HttpServletRequest request, String name, int defaultValue) {
        int result = defaultValue;
        String value = request.getParameter(name);
        if (StringUtils.isNotBlank(value)) {
            try {
                result = Integer.valueOf(request.getParameter(name));
            } catch (Exception e) {}
        }
        return result;
    }
    public static void encodeZipWrite(HttpServletResponse response, Object obj) {
        zipWrite(response, obj, true);
    }
    public static void write(HttpServletResponse response, Object obj) {
        if (obj != null) {
            PrintWriter out = null;
            try {
                out = new PrintWriter(response.getOutputStream());
                String content = obj.toString();
                out.write(content);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (out != null) out.close();
            }
        }
    }
    public static void zipWrite(HttpServletResponse response, Object obj) {
        zipWrite(response, obj, false);
    }
    public static void zipWrite(HttpServletResponse response, Object obj, boolean encode) {
        if (obj != null) {
            PrintWriter out = null;
            response.setHeader("Content-Encoding", "gzip");
            try {
                out = new PrintWriter(new GZIPOutputStream(response.getOutputStream()));
                String content = encode ? ParseKsy.encode(obj.toString()) : obj.toString();
                out.write(content);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (out != null) out.close();
            }
        }
    }
    public static void zipWrite(HttpServletResponse response, Object obj, Logger log) {
        log.info("output:" + obj);
        zipWrite(response, obj, false);
    }
}
