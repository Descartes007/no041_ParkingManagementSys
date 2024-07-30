package com.wang.exception;

public class DataAccessException extends Exception{

    /**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	/** 
     * <默认构造函数>
     */
    public DataAccessException()
    {
        // TODO Auto-generated constructor stub
    }
    
    /** 
     * <默认构造函数>
     */
    public DataAccessException(String message)
    {
        super(message);
        // TODO Auto-generated constructor stub
    }
    
    /** 
     * <默认构造函数>
     */
    public DataAccessException(Throwable cause)
    {
        super(cause);
        // TODO Auto-generated constructor stub
    }
    
    /** 
     * <默认构造函数>
     */
    public DataAccessException(String message, Throwable cause)
    {
        super(message, cause);
        // TODO Auto-generated constructor stub
    }
}
