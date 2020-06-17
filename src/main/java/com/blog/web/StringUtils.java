package com.blog.web;

public class StringUtils {
	//由于html中<和>会被转义成便签的括号，所以需要存为&lt;和&gt;，在此处进行转换
	public static String HTMLTransfer(String parameter) {
		int i=0;
		//char[] arr=new char[30000];
		String s="";
		while(i<parameter.length()) {
//			System.out.println(arr);
			if(parameter.charAt(i)=='<') {
//				arr[j++]='&';
//				arr[j++]='l';
//				arr[j++]='t';
//				arr[j++]=';';
				s=s+"&lt;";
			}
			else if(parameter.charAt(i)=='>') {
//				arr[j++]='&';
//				arr[j++]='g';
//				arr[j++]='t';
//				arr[j++]=';';
				s=s+"&gt;";
			}
			else {
//				arr[j++]=parameter.charAt(i);
				s=s+parameter.charAt(i);
				}
			i++;
		}
//		return new String(arr);
		return s;
	}
	public static void main(String[] args) {
		System.out.println(StringUtils.HTMLTransfer("hh1<hh2>hh3"));
	}

}
