package com.king.util;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;
/**
 * 字符串转日期工具类
 * 类名: StringToDateConvert.java
 * 创建人: king 
 * 创建时间：2016年4月21日 下午2:20:14 
 * @version 1.0.0
 */
public class StringToDateConvert implements Converter<String, Date> {

    private static final DateFormat DATEFORMAT = new SimpleDateFormat("yyyy-MM-dd");
    @SuppressWarnings("unused")
	private static final DateFormat TIMEFORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    @Override
	public Date convert(String dateString) {
		try {
			return DATEFORMAT.parse(dateString);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
}
