/*
 * 文 件 名: PageRueslt.java
 * 版 权: Copyright YYYY-YYYY, All rights reserved
 * 描 述: <描述>
 * 创 建 人: 贲辉 benhui@itany.com
 * 创建时间: 2012-9-27
 */
package com.wang.utils;

import java.util.List;

/**
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author 贲辉
 * @version [V1.00, 2012-9-27]
 * @see [相关类/方法]
 * @since V1.00
 */
public class PageRueslt<T>
{
    private int pageNo = 1;
    
    private int totleNo;
    
    private int pageSize = 10;
    
    private List<T> list;
    
    public int getPageNo()
    {
        return pageNo;
    }
    
    public void setPageNo(int pageNo)
    {
        if (pageNo <= totleNo)
        {
            this.pageNo = pageNo;
        }
        else
        {
            this.pageNo = totleNo;
        }
    }
    
    public int getTotleNo()
    {
        return totleNo;
    }
    
    public void setTotleNo(int totleRum)
    {
        if (totleRum % pageSize == 0)
        {
            this.totleNo = totleRum / pageSize;
        }
        else
        {
            this.totleNo = totleRum / pageSize + 1;
        }
        
    }
    
    public List<T> getList()
    {
        return list;
    }
    
    public void setList(List<T> list)
    {
        this.list = list;
    }
    
}
