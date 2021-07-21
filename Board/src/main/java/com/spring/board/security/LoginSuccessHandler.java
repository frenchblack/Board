package com.spring.board.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

public class LoginSuccessHandler implements AuthenticationSuccessHandler{
	private static final Logger logger = LoggerFactory.getLogger(LoginSuccessHandler.class);
	
	private String defaultTargetUrl;
    private RequestCache requestCache = new HttpSessionRequestCache();
    private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();


	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		logger.info("onAuthenticationSuccess");
		// TODO Auto-generated method stub
		
		
		clearAuthenticationAttributes(request);
		resultRedirectStrategy(request, response, authentication);
	}
	
    protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        
        SavedRequest savedRequest = requestCache.getRequest(request, response);
        
        if(savedRequest!=null) {
            String targetUrl = savedRequest.getRedirectUrl();
            redirectStratgy.sendRedirect(request, response, targetUrl);
        } else {
            redirectStratgy.sendRedirect(request, response, defaultTargetUrl);
        }
        
    }
	
    protected void clearAuthenticationAttributes(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session==null) return;
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
    }
	
	public String getDefaultTargetUrl() {
		return defaultTargetUrl;
	}

	public void setDefaultTargetUrl(String defaultTargetUrl) {
		this.defaultTargetUrl = defaultTargetUrl;
	}

}
