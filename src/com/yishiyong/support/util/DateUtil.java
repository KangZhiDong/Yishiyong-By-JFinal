package com.yishiyong.support.util;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
/**
 * Created by dee on 15/9/16.
 */

/**
 *
 */

public abstract class DateUtil {

    /*
     * mode(模式) (受次影响的是getStringOfDate()方法) 第一种,返回正常的date的字符串(默认的)
     * 第二种,返回date的当天的开始时间 第三种,返回date的当天的结束时间
     */
    public final static String defaultMode = "normalOfDate";

    public final static String beginOfDateMode = "beginOfDate";

    public final static String endOfDateMode = "endOfDate";

    /**
     * 一天的秒数
     */
    public final static int DAY_SECOND = 24 * 60 * 60;
    /**
     * 一天的毫秒数
     */
    public final static long DAY_MILLISECOND = DAY_SECOND * 1000;

    /**
     * 默认的日期格式字符串 yyyy-MM-dd
     */
    public final static String exportXlsDateCreateTimeFormat = "yyyy-MM-dd HH:mm";// 创建时间，由于后台几乎所有的创建时间都是用这种形式展示，故设一常量
    public final static String exportXlsDateFormat = "yyyy.MM.dd";// 导出xls文件的文件名中时间部分格式
    public final static String defaultDatePatternStr = "yyyy-MM-dd";
    public final static String chineseDatePatternStr = "yyyy年MM月dd日";
    /**
     * 默认的日期时间格式字符串 yyyy-MM-dd HH:mm:ss
     */
    public final static String defaultDateTimePatternStr = "yyyy-MM-dd HH:mm:ss";
    /**
     * 默认的长日期时间格式字符串 yyyy-MM-dd HH:mm:ss:SSS
     */
    public final static String defaultLongDateTimePatternStr = "yyyy-MM-dd HH:mm:ss:SSS";

    public final static String defaultLongDateTimePatternStr2 = "yyyy-MM-dd-HH-mm-ss-SSS";


    /**
     * 表示“日，一，二，三，四，五，六”
     */
    private final static String as[] = {"\u5929", "\u4E00", "\u4E8C", "\u4E09", "\u56DB", "\u4E94", "\u516D"};

    public enum DatePart {
        /**
         * 年
         */
        yy,
        /**
         * 月
         */
        MM,
        /**
         * 日
         */
        dd,
        /**
         * 时
         */
        HH,
        /**
         * 分
         */
        mm,
        /**
         * 秒
         */
        ss,
        /**
         * 毫秒
         */
        SSS
    }

    /**
     * 把Date.gettime()的值还原回Date
     * @param timeString
     * @return
     */
    public static Date getByTime(String timeString) {
        Date date = null;
        if (!StringUtil.isEmpty(timeString))
            date = new Date(Long.valueOf(timeString));
        else
            date = new Date();
        return date;
    }

    /**
     * 把字符串格式化成日期类型("yyyy-MM-dd HH:mm:ss")
     * @param dateStr
     * @return
     * @throws ParseException
     */
    public static Date convertStr2Date(String dateStr) throws ParseException {
        return parse(dateStr, defaultDateTimePatternStr);
    }

    /**
     * 把字符串格式化成日期类型
     * @param dateStr
     * @param pattern 日期格式，为空时默认为"yyyy-MM-dd HH:mm:ss"格式
     * @return
     * @throws ParseException
     */
    public static Date parse(String dateStr, String pattern) throws ParseException {
        if (pattern == null)
            pattern = defaultDateTimePatternStr;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        Date date = simpleDateFormat.parse(dateStr);
        return date;
    }

    /**
     * 将Date类型的日期转换成"yyyy-MM-dd HH:mm:ss"类型的字符串
     * @param date
     * @return
     */
    public static String convertDate2Str(Date date) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(defaultDateTimePatternStr);
        return simpleDateFormat.format(date);
    }

    /**
     * 将Date类型的日期转换成指定格式的字符串
     * @param date
     * @param pattern
     * @return
     */
    public static String format(Date date, String pattern) {
        if (pattern == null)
            pattern = defaultDateTimePatternStr;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        return simpleDateFormat.format(date);
    }

    /**
     * 获取指定日期的开始时间
     * @param date
     * @return
     */
    public static Date getBeginOfDay(Date date) {
        Calendar cld = Calendar.getInstance();
        cld.setTime(date);
        cld.set(Calendar.HOUR_OF_DAY, 0);
        cld.set(Calendar.MINUTE, 0);
        cld.set(Calendar.SECOND, 0);
        cld.set(Calendar.MILLISECOND, 0);
        return cld.getTime();
    }

    /**
     * 获取指定日期的最后时间
     * @param date
     * @return
     */
    public static Date getEndOfDay(Date date) {
        Calendar cld = Calendar.getInstance();
        cld.setTime(date);
        cld.set(Calendar.HOUR_OF_DAY, 23);
        cld.set(Calendar.MINUTE, 59);
        cld.set(Calendar.SECOND, 59);
        cld.set(Calendar.MILLISECOND, 999);
        return cld.getTime();
    }

    /**
     * 方法用途和描述: 取得当前时间的字符串 例如：20080221050416
     * @return
     */
    public static String getCurrentTimeStr() {
        return format(new Date(), "yyyyMMddHHmmss");
    }

    /**
     * 比较两个日期，忽略时间，如果date1 > date 2，返回1，date1 = date2，返回0，date1 < date2，返回-1
     * @param date1
     * @param date2
     * @return
     */
    public static int compareDateIgnoreTime(Date date1, Date date2) {
        date1 = ignoreTime(date1);
        date2 = ignoreTime(date2);
        return compareDateTime(date1, date2);
    }

    /**
     * 比较两个时间，忽略分，如果date1 > date 2，返回1，date1 = date2，返回0，date1 < date2，返回-1
     * @param date1
     * @param date2
     * @return
     */
    public static int compareDateTimeIgnoreMinute(Date date1, Date date2) {
        date1 = ignoreMinute(date1);
        date2 = ignoreMinute(date2);
        return compareDateTime(date1, date2);
    }

    /**
     * 比较两个时间，忽略秒，如果date1 > date 2，返回1，date1 = date2，返回0，date1 < date2，返回-1
     * @param date1
     * @param date2
     * @return
     */
    public static int compareDateTimeIgnoreSecond(Date date1, Date date2) {
        date1 = ignoreSecond(date1);
        date2 = ignoreSecond(date2);
        return compareDateTime(date1, date2);
    }

    /**
     * 比较两个时间，忽略毫秒，如果date1 > date 2，返回1，date1 = date2，返回0，date1 < date2，返回-1
     * @param date1
     * @param date2
     * @return
     */
    public static int compareDateTimeIgnoreMillisecond(Date date1, Date date2) {
        date1 = ignoreMillisecond(date1);
        date2 = ignoreMillisecond(date2);
        return compareDateTime(date1, date2);
    }

    /**
     * 比较两个时间，如果date1 > date 2，返回1，date1 = date2，返回0，date1 < date2，返回-1
     * @param date1
     * @param date2
     * @return
     */
    public static int compareDateTime(Date date1, Date date2) {
        if (date1.after(date2))
            return 1;
        if (date1.before(date2))
            return -1;
        return 0;
    }

    /**
     * 忽略时间，把时、分、秒、毫秒都变为0
     * @param date
     * @return
     */
    public static Date ignoreTime(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }

    /**
     * 方法用途和描述: 忽略分，分、秒、毫秒都变为0
     * @param date
     * @return
     */
    public static Date ignoreMinute(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }

    /**
     * 方法用途和描述: 忽略秒，秒、毫秒都变为0
     * @param date
     * @return
     */
    public static Date ignoreSecond(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }

    /**
     * 方法用途和描述: 忽略毫秒，毫秒变为0
     * @param date
     * @return
     */
    public static Date ignoreMillisecond(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }

    /**
     *
     * @param date
     * @return
     */

    public static String getStringOfDate(Date date, String pattern, String mode) {
        Date modeDate = null;
        if (pattern == null)
            pattern = DateUtil.defaultDateTimePatternStr;
        if (mode == null)
            mode = DateUtil.defaultMode;
        if (mode.equals(DateUtil.defaultMode))
            modeDate = date;
        else if (mode.equals(DateUtil.beginOfDateMode))
            modeDate = DateUtil.getBeginOfDay(date);
        else if (mode.equals(DateUtil.endOfDateMode))
            modeDate = DateUtil.getEndOfDay(date);
        else
            throw new IllegalArgumentException("getStringOfDate(Date date,String pattern,String mode)方法参数非法: " + mode);

        Long dateTime = modeDate.getTime();
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        return sdf.format(new Date(dateTime));
    }

    /**
     * 次方法是传入任意的date,任意的格式,输出的是pattern模式的date
     * @param date
     * @param pattern
     * @param mode
     * @return
     * @throws ParseException
     */
    public static Date getDate(Date date, String pattern, String mode) throws ParseException {
        Date modeDate = null;
        if (pattern == null)
            pattern = DateUtil.defaultDateTimePatternStr;
        if (mode == null)
            mode = DateUtil.defaultMode;
        if (mode.equals(DateUtil.defaultMode))
            modeDate = date;
        else if (mode.equals(DateUtil.beginOfDateMode))
            modeDate = DateUtil.getBeginOfDay(date);
        else if (mode.equals(DateUtil.endOfDateMode))
            modeDate = DateUtil.getEndOfDay(date);
        else
            throw new IllegalArgumentException("getStringOfDate(Date date,String pattern,String mode)方法参数非法: " + mode);

        Long dateTime = modeDate.getTime();
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        String dateString = sdf.format(new Date(dateTime));
        return parse(dateString, pattern);
    }

    /**
     * 得到num天后(负数表示前)
     * @param num
     * @return
     */
    public static Date getDate(int num){
        long time = System.currentTimeMillis() + (1000L * 60 * 60 * 24 * num);
        return new Date(time);
    }

    /**
     *  判断当前时间是否在指定时间闭区间之内
     * @param validFrom
     * @param validTo
     * @return
     */
    public static boolean isDuring(Date specifiedDate, Date validFrom, Date validTo) {
        if (validFrom == null || validTo == null)
            return false;
        if (DateUtil.compareDateTime(specifiedDate, validFrom) >= 0 && DateUtil.compareDateTime(specifiedDate, validTo) <= 0)
            return true;
        return false;
    }

    /**
     *  判断某个指定时间是否在指定时间闭区间之内
     * @param validFrom
     * @param validTo
     * @return
     */
    public static boolean isDuringIgnoreTime(Date specifiedDate, Date validFrom, Date validTo) {
        if (specifiedDate == null || validFrom == null || validTo == null)
            return false;
        return isDuring(ignoreTime(specifiedDate), ignoreTime(validFrom), ignoreTime(validTo));
    }

    /**
     *  判断当前时间是否在指定时间闭区间之内
     * @param validFrom
     * @param validTo
     * @return
     */
    public static boolean isDuring(Date validFrom, Date validTo) {
        return isDuring(new Date(), validFrom, validTo);
    }

    /**
     *  判断当前时间是否在指定时间闭区间之内
     * @param validFrom
     * @param validTo
     * @return
     */
    public static boolean isDuringIgnoreTime(Date validFrom, Date validTo) {
        return isDuringIgnoreTime(new Date(), validFrom, validTo);
    }
    /**
     * 获取minute分钟前的时间
     * @param minute 当day为负数时，表示取N天前的时间
     * @return
     */
    public static Date getBeforeTime(int minute) {
        Date now = new Date();
        long l = minute * 60 * 1000L;
        return new Date(now.getTime() - l);
    }

    public static Date getNextDate(Date date){
        return new Date(date.getTime() + 24*60*60 * 1000L );
    }

    /**
     * 获取当前是星期几
     * @return
     */
    public static String getWeekName(){
        Calendar calendar = Calendar.getInstance();
        int i = calendar.get(7) - 1;
        return as[i];
    }

    /**
     * 获取某一年某月的第一天,如2015-03-01
     * @param year
     * @param month
     * @return
     */
    public static Date getBeginDayOfMonth(int year, int month){
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR,year);
        cal.set(Calendar.MONTH, month-1);
        cal.set(Calendar.DATE, 1);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }

    /**
     * 获取某一年某月的第一天,如2015-03-01
     * @param year
     * @param month
     * @return
     */
    public static Date getEndDayOfMonth(int year, int month){
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR,year);
        cal.set(Calendar.MONTH, month-1);
        cal.set(Calendar.DATE, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
        cal.set(Calendar.HOUR_OF_DAY, 23);
        cal.set(Calendar.MINUTE, 59);
        cal.set(Calendar.SECOND, 59);
        cal.set(Calendar.MILLISECOND, 999);
        return cal.getTime();
    }

    public static void main(String[] args){

        System.out.print(DateUtil.format(getEndDayOfMonth(2015,3),DateUtil.exportXlsDateCreateTimeFormat));

    }

}

