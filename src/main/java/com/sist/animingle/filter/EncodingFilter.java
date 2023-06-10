package com.sist.animingle.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter {

    private String encoding;
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
        this.encoding = filterConfig.getInitParameter("encoding");
        
        if(this.encoding == null || this.encoding.equals("")) {
            this.encoding = "UTF-8";
        }
        
    }
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        //인코딩 처리
        request.setCharacterEncoding(this.encoding);
        
        //그 다음 필터 호출 or 필터가 없으면 서블릿 호출
        chain.doFilter(request, response);
    }
    
    @Override
    public void destroy() {
    }
    
}