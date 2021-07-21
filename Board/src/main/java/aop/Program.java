package aop;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import aop.entity.Exam;

public class Program {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("aop/setting.xml");
				//new AnnotationConfigApplicationContext();
		
		Exam exam = (Exam) context.getBean("exam");
		
		System.err.println("total is " + exam.total());
		System.err.println("total is " + exam.avg());
		
		
//		Exam exam = new NewlecExam(1,1,1,1); 
//		
//		Exam proxy = (Exam) Proxy.newProxyInstance(NewlecExam.class.getClassLoader()
//										  , new Class[] {Exam.class}
//										  , new InvocationHandler() {
//											
//											@Override
//											public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
//												
//												long start = System.currentTimeMillis();
//												
//												Object result = method.invoke(exam, args);
//												
//												long end = System.currentTimeMillis();
//												
//												String message = (end - start) + "ms 시간이 걸렸습니다.";
//												System.out.println(message);
//												
//												return result;
//											}
//										});
		

	}
}
