package br.com.professores.controller;

import br.com.professores.modeljson.Marker;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String home() {
        System.out.println("EXECUTANDO INDEX !!!!");
        return "home";
    }

    @RequestMapping("/geolocation")
    public String geolocation() {
        return "geolocation";
    }

    @RequestMapping(value = "/loadMarkers", method = RequestMethod.GET)

    public ModelAndView loadMarkers() {

        List<Marker> markers = new ArrayList<>();
        
        markers.add(new Marker("Stockholm", "59.3", "18.1", "Bla bla bla bla bla bla bla"));
        markers.add(new Marker("Oslo", "59.9", "10.8", "Oslo is a municipality, and the capital and most populous city of Norway with a metropolitan population of 1,442,318 (as of 2010)."));
        markers.add(new Marker("Copenhagen", "55.7", "12.6", "Copenhagen is the capital of Denmark and its most populous city, with a metropolitan population of 1,931,467 (as of 1 January 2012)."));

        ModelAndView model = new ModelAndView("geolocation");
        model.addObject("markers", markers);

        System.out.println("AAAAAA");

        return model;
    }

}
