package com.wang.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil
{
    public static String dateToString(Date date)
    {
        DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        String str = df.format(date);
        return str;
    }
    
    public static Date getDate(String str)
    {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try
        {
            date = df.parse(str);
        }
        catch (ParseException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return date;
    }
}
