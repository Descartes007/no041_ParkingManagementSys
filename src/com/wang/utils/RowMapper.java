package com.wang.utils;

import java.sql.ResultSet;

/**
 * 
 * <RM映射>
 * <功能详细描述>
 * 
 * @author 崔译
 * @version [V1.00, 2012-11-6]
 * @see [相关类方法]
 * @since V1.00
 */
public interface RowMapper{
    public Object mapRow(ResultSet rs)throws Exception;
}
