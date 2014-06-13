/**
 * 
 */
package com.touchnet.test.antisamy;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.owasp.validator.html.AntiSamy;
import org.owasp.validator.html.CleanResults;
import org.owasp.validator.html.Policy;

/**
 * @author jverderber
 *
 */
public class AntiSamyBean {

	private String resourcesRoot = null;
	
	/**
	 * 
	 */
	public AntiSamyBean(HttpServletRequest request) 
	{
		try 
		{
			File rrp = new File(request.getServletContext().getRealPath("resources_root.properties"));
			
			setResourcesRoot(rrp.getParentFile().getAbsolutePath());
			
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		
	}

	/**
	 * @return the resourcesRoot
	 */
	public String getResourcesRoot() {
		return resourcesRoot;
	}

	/**
	 * @param resourcesRoot the resourcesRoot to set
	 */
	public void setResourcesRoot(String resourcesRoot) {
		this.resourcesRoot = resourcesRoot;
	}
	
	public String getFileContents(String fname)
	{
		StringWriter rtn = new StringWriter();
		PrintWriter pw = new PrintWriter(rtn);
		String rr = getResourcesRoot();
		if(!rr.endsWith(File.separator)){rr+=File.separator;}
		String rp = rr+fname;
		try {
			BufferedReader br = new BufferedReader(new FileReader(new File(rp)));
			String line = br.readLine();
			while(line!=null){pw.println(line);line=br.readLine();}
			br.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		pw.close();
		return rtn.toString();
	}
	
	public boolean passesPolicy(String text,String policy) throws Exception
	{
		boolean rtn = false;
		File f = new File("tmpPolicy_"+new Date().getTime()+".xml");
		FileWriter fw = new FileWriter(f,false);
		fw.write(policy);
		fw.close();
		Thread.sleep(50);
		Policy p = Policy.getInstance(f);
		AntiSamy as = new AntiSamy();
		CleanResults cr = as.scan(text,p);
		rtn = cr.getNumberOfErrors()==0;
		return rtn;
	}
	public String scrubHtml(String text,String policy) throws Exception
	{
		String rtn = "";
		File f = new File("tmpPolicy_"+new Date().getTime()+".xml");
		FileWriter fw = new FileWriter(f,false);
		fw.write(policy);
		fw.close();
		Thread.sleep(50);
		Policy p = Policy.getInstance(f);
		AntiSamy as = new AntiSamy();
		CleanResults cr = as.scan(text,p);
		rtn = cr.getCleanHTML();
		return rtn;
	}

}
