package aop.advice;

import java.lang.reflect.Method;

import org.springframework.aop.AfterReturningAdvice;
import org.springframework.aop.ThrowsAdvice;

public class LogAfterThrowingAdvice implements ThrowsAdvice{

	public void afterThrowing(IllegalArgumentException e) throws Throwable {
		System.out.println("예외가 발생하였습니다." + e.getMessage());
	}
}
