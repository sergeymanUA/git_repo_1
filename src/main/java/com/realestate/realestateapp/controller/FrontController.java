package com.realestate.realestateapp.controller;

import com.realestate.realestateapp.model.RealEstate;
import com.realestate.realestateapp.model.User;
import com.realestate.realestateapp.search.SearchCriteria;
import com.realestate.realestateapp.service.RealEstateService;
import com.realestate.realestateapp.service.SecurityService;
import com.realestate.realestateapp.service.UserService;
import com.realestate.realestateapp.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Collections;
import java.io.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class FrontController {

    @Autowired
    private UserService userService;

    @Autowired
    private RealEstateService realEstateService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);
        securityService.autoLogin(userForm.getUsername(), userForm.getConfirmPassword());
        return "redirect:/main";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", "Username or password is incorrect.");
        }

        if (logout != null) {
            model.addAttribute("message", "Logged out successfully.");
        }

        return "login";
    }

    @RequestMapping(value = "/manageUsers", method = RequestMethod.GET)
    public String manageUsers(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", this.userService.findAll());

        return "manageUsers";
    }

    @RequestMapping("/removeUser/{id}")
    public String removeUser(@PathVariable("id") int id){
        this.realEstateService.deleteById(new Long(id));

        return "redirect:/manageUsers";
    }

    @RequestMapping("/editUser/{id}")
    public String editUser(@PathVariable("id") int id, ModelMap model){
        model.addAttribute("user", this.userService.findById(new Long(id)));
        model.addAttribute("listUsers", this.userService.findAll());

        return "manageUsers";
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user, @RequestParam("userId") int userId,
                          BindingResult bindingResult){
        if (!new Long(-1).equals(new Long(userId))) {
            user.setId(new Long(userId));
            this.userService.save(user);
        }
        else {
            this.userService.save(user);
        }

        return "redirect:/manageUsers";
    }

    //* *************** Real Estates block *************************
    @RequestMapping(value = "/manageEstates", method = RequestMethod.GET)
    public String manageEstates(Model model) {
        model.addAttribute("realEstate", new RealEstate());
        model.addAttribute("listEstates", this.realEstateService.findAll());

        return "manageEstates";
    }

    @RequestMapping("/removeEstate/{id}")
    public String removeEstate(@PathVariable("id") int id){
        this.realEstateService.deleteById(new Long(id));

        return "redirect:/manageEstates";
    }

    @RequestMapping("/editEstate/{id}")
    public String editEstate(@PathVariable("id") int id, ModelMap model){
        model.addAttribute("realEstate", this.realEstateService.findById(new Long(id)));
        model.addAttribute("listEstates", this.realEstateService.findAll());

        return "manageEstates";
    }

    @RequestMapping(value = "/realEstate/add", method = RequestMethod.POST)
    public String addEstate(@ModelAttribute("realEstate") RealEstate realEstate,
                            @RequestParam("estateId") int estateId,
                          BindingResult bindingResult) {
        if (!new Long(-1).equals(new Long(estateId))) {
            realEstate.setId(new Long(estateId));
            this.realEstateService.save(realEstate);
        }
        else {
            this.realEstateService.save(realEstate);
        }

        return "redirect:/manageEstates";
    }
    //* *************** Real Estates block *************************

    @RequestMapping(value = {"/", "/main"}, method = RequestMethod.GET)
    public String main(Model model) {
        model.addAttribute("listRealEstates", this.realEstateService.findAll());
        return "main";
    }

    @RequestMapping(value = "/main", method = RequestMethod.POST)
    public String main(@ModelAttribute("userForm") SearchCriteria searchCriteria,
                       BindingResult bindingResult, Model model) {

        List<RealEstate> allRealEstates = this.realEstateService.findAll();
        List<RealEstate> filteredRealEstates = new ArrayList<>();

        Byte searchedRoomNumber = null;
        Double searchedPriceFrom = null;
        Double searchedPriceTo = null;

        try {
            if (!searchCriteria.getRoomsNumber().isEmpty()) {
                searchedRoomNumber = Byte.valueOf(searchCriteria.getRoomsNumber());
            }

            if (!searchCriteria.getPriceFrom().isEmpty()) {
                searchedPriceFrom = Double.parseDouble(searchCriteria.getPriceFrom());
            }

            if (!searchCriteria.getPriceTo().isEmpty()) {
                searchedPriceTo = Double.parseDouble(searchCriteria.getPriceTo());
            }
        }
        catch (NumberFormatException ex) {
            ex.printStackTrace();
        }

        for(RealEstate realEstate: allRealEstates) {

            boolean conditionForAdding = true;

            if((searchedRoomNumber == null) && (searchedPriceFrom == null) && (searchedPriceTo == null)) {
                filteredRealEstates.addAll(allRealEstates);
                break;
            }

            if(searchedRoomNumber != null) {
                conditionForAdding = conditionForAdding && realEstate.getNrooms().equals(searchedRoomNumber);
            }

            if(searchedPriceFrom != null) {
                conditionForAdding = conditionForAdding && (realEstate.getInitPrice() >= searchedPriceFrom);
            }

            if(searchedPriceTo != null) {
                conditionForAdding = conditionForAdding && (realEstate.getInitPrice() <= searchedPriceTo);
            }

            if(conditionForAdding) {
                filteredRealEstates.add(realEstate);
            }
        }

        model.addAttribute("listRealEstates", filteredRealEstates);
        return "main";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin() {
        return "admin";
    }

    //* *************************************Datatable*******************************
    //http://javahonk.com/spring-mvc-pagination-datatables/
    @RequestMapping(value = "/helloWorld.web", method =
            RequestMethod.GET)
    public String printWelcome(@ModelAttribute("person") Person person, BindingResult result,
                               ModelMap model, HttpServletRequest request, HttpServletResponse response) {

        return "_hello";

    }

    @RequestMapping(value = "/springPaginationDataTables.web", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody String springPaginationDataTables(HttpServletRequest  request) throws IOException {

        //Fetch the page number from client
        Integer pageNumber = 0;
        if (null != request.getParameter("iDisplayStart"))
            pageNumber = (Integer.valueOf(request.getParameter("iDisplayStart"))/10)+1;

        //Fetch search parameter
        String searchParameter = request.getParameter("sSearch");

        //Fetch Page display length
        Integer pageDisplayLength = Integer.valueOf(request.getParameter("iDisplayLength"));

        //Create page list data
        List<Person> personsList = createPaginationData(pageDisplayLength);

        //Here is server side pagination logic. Based on the page number you could make call
        //to the data base create new list and send back to the client. For demo I am shuffling
        //the same list to show data randomly
        if (pageNumber == 1) {
            Collections.shuffle(personsList);
        }else if (pageNumber == 2) {
            Collections.shuffle(personsList);
        }else {
            Collections.shuffle(personsList);
        }

        //Search functionality: Returns filtered list based on search parameter
        personsList = getListBasedOnSearchParameter(searchParameter,personsList);


        PersonJsonObject personJsonObject = new PersonJsonObject();
        //Set Total display record
        personJsonObject.setiTotalDisplayRecords(500);
        //Set Total record
        personJsonObject.setiTotalRecords(500);
        personJsonObject.setAaData(personsList);

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json2 = gson.toJson(personJsonObject);

        return json2;
    }

    private List<Person> getListBasedOnSearchParameter(String searchParameter,List<Person> personsList) {

        if (null != searchParameter && !searchParameter.equals("")) {
            List<Person> personsListForSearch = new ArrayList<Person>();
            searchParameter = searchParameter.toUpperCase();
            for (Person person : personsList) {
                if (person.getName().toUpperCase().indexOf(searchParameter)!= -1 || person.getOffice().toUpperCase().indexOf(searchParameter)!= -1
                        || person.getPhone().toUpperCase().indexOf(searchParameter)!= -1 || person.getPosition().toUpperCase().indexOf(searchParameter)!= -1
                        || person.getSalary().toUpperCase().indexOf(searchParameter)!= -1 || person.getStart_date().toUpperCase().indexOf(searchParameter)!= -1) {
                    personsListForSearch.add(person);
                }

            }
            personsList = personsListForSearch;
            personsListForSearch = null;
        }
        return personsList;
    }

    private List<Person> createPaginationData(Integer pageDisplayLength) {
        List<Person> personsList = new ArrayList<Person>();
        for (int i = 0; i < 1; i++) {
            Person person2 = new Person();
            person2.setName("John Landy");
            person2.setPosition("System Architect");
            person2.setSalary("$320,800");
            person2.setOffice("NY");
            person2.setPhone("999999999");
            person2.setStart_date("05/05/2010");
            personsList.add(person2);

            person2 = new Person();
            person2.setName("Igor Vornovitsky");
            person2.setPosition("Solution Architect");
            person2.setSalary("$340,800");
            person2.setOffice("NY");
            person2.setPhone("987897899");
            person2.setStart_date("05/05/2010");
            personsList.add(person2);

            person2 = new Person();
            person2.setName("Java Honk");
            person2.setPosition("Architect");
            person2.setSalary("$380,800");
            person2.setOffice("NY");
            person2.setPhone("1234567890");
            person2.setStart_date("05/05/2010");
            personsList.add(person2);

            person2 = new Person();
            person2.setName("Ramesh Arrepu");
            person2.setPosition("Sr. Architect");
            person2.setSalary("$310,800");
            person2.setOffice("NY");
            person2.setPhone("4654321234");
            person2.setStart_date("05/05/2010");
            personsList.add(person2);

            person2 = new Person();
            person2.setName("Bob Sidebottom");
            person2.setPosition("Architect");
            person2.setSalary("$300,800");
            person2.setOffice("NJ");
            person2.setPhone("9876543212");
            person2.setStart_date("05/05/2010");
            personsList.add(person2);

        }

        for (int i = 0; i < pageDisplayLength-5; i++) {
            Person person2 = new Person();
            person2.setName("Zuke Torres");
            person2.setPosition("System Architect");
            person2.setSalary("$320,800");
            person2.setOffice("NY");
            person2.setPhone("999999999");
            person2.setStart_date("05/05/2010");
            personsList.add(person2);
        }
        return personsList;
    }
}


/*
1) admin.jsp - no view?
2) Adding (upload) images - like addREImage() -> [BG p. 137], [S4 Pro p. 686] - IMultipartResolver
 */
