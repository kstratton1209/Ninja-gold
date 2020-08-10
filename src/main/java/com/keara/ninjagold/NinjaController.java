package com.keara.ninjagold;

import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NinjaController {
	
	public Random random = new Random();
	
	@RequestMapping("/")
	public String index(HttpSession session, Model model){
        Integer totalGold = (Integer) session.getAttribute("total");
        ArrayList<String> log = (ArrayList<String>) session.getAttribute("log");
        if (totalGold == null) {
        	session.setAttribute("total", 0);
        	totalGold = 0;
        }
        if (log == null) {
        	log = new ArrayList<String>();
        }
        
        model.addAttribute("total", totalGold);
        model.addAttribute("log", log);
		return "index.jsp";
    }
	
	@RequestMapping("/process")
	public String process(@RequestParam(value = "location") String location, HttpSession session) {
		System.out.println(location);
		Integer totalGold  = (Integer) session.getAttribute("total");
        ArrayList<String> log = (ArrayList<String>) session.getAttribute("log");
        
        if(log ==null) {
        	log = new ArrayList<String>();
        }
        
		if(location.equals("farm")) {
				
				int gold = random.nextInt(10) + 10;
				String msg = "You just visited the " + location + " and found " + gold + " gold.";
				log.add(msg);
				totalGold += gold;
				
		}
		
		if(location.equals("cave")) {
			
			int gold = random.nextInt(5) + 5;
			String msg = "You just visited the " + location + " and found " + gold + " gold.";
			log.add(msg);
			totalGold += gold;
			
		}
		
		if(location.equals("house")) {
			
			int gold = random.nextInt(2) + 3;
			String msg = "You just visited the " + location + " and found " + gold + " gold.";
			log.add(msg);
			totalGold += gold;
			
		}
		
		if(location.equals("casino")) {
			
			int gold = random.nextInt(50 + 50) - 50;
			if (gold > 0) {
				String msg = "Congrats! You just visited the " + location + " and found " + gold + " gold.";
				log.add(msg);
				totalGold += gold;

			}
			else {
				String msg = "You just visited the " + location + " and lost " + gold + " gold.";
				log.add(msg);
				totalGold += gold;
			}
			
			
		}
		
		
		session.setAttribute("total", totalGold);
		session.setAttribute("log",log);
		return "redirect:/";
	}
}
