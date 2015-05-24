package br.com.professores.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import br.com.professor.interfaces.ServerLocationBo;
import br.com.professores.implementation.ServerLocationBoImpl;
import br.com.professores.model.ServerLocation;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class HomeController {

	ServerLocationBo serverLocationBo = new ServerLocationBoImpl();

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getPages() {

		ModelAndView model = new ModelAndView("map");
		return model;

	}

	// return back json string
	@RequestMapping(value = "/getLocationByIpAddress", method = RequestMethod.GET)
	public @ResponseBody String getDomainInJsonFormat(
			@RequestParam String ipAddress) {

		ObjectMapper mapper = new ObjectMapper();

		ServerLocation location = serverLocationBo.getLocation(ipAddress);

		String result = "";

		try {
			result = mapper.writeValueAsString(location);
		} catch (Exception e) {

			e.printStackTrace();
		}

		return result;

	}

}
