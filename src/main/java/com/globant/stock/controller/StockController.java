package com.globant.stock.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mongodb.*;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.util.JSON;
import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;


import com.globant.stock.entity.Stock;
import com.globant.stock.service.StockService;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StockController {

    @Autowired
    private StockService stockService;

    @RequestMapping(value = { "/shareDetails" }, method = RequestMethod.GET)
    public ModelAndView viewStockList() {
        ModelAndView mv=new ModelAndView();
        mv.addObject("shares", stockService.getAllStock());
        mv.setViewName("shareDetails");
        return mv;
    }
    @GetMapping("getForm")
    public String getForm() {
        return "stockForm";
    }

    @PostMapping("/addStock")
    public String saveDetails(@RequestParam(value ="name",required = false) String name,
                              @RequestParam(value ="stockPrice", required = false) String stockPrice,
                              @RequestParam(value = "numOfStock",required = false) String numOfStock,
                              ModelMap modelMap,@Valid @ModelAttribute("stock") Stock stock) {
        modelMap.put("name", name);
        modelMap.put("stockPrice", stockPrice);
        //modelMap.put("totalValue", totalValue);
        modelMap.put("numOfStock", numOfStock);
        //modelMap.put("now", now);
        stockService.saveStock(stock);
        try {
            ObjectMapper mapper = new ObjectMapper();
            //modelMap.addAttribute("json", mapper.writeValueAsString(stock));
            //System.out.println("================================="+mapper.writeValueAsString(stock));
            String json = mapper.writeValueAsString(stock);
            copyToMongoDB(json);
        }catch (JsonProcessingException e){
            e.printStackTrace();
        }
        return "index";
    }
    private void copyToMongoDB(String json){
        MongoClient mongo = new MongoClient("127.0.0.1", 27017);
        DB db = mongo.getDB("stockdb");
        DBCollection collection = db.getCollection("stock");

//      Delete All documents before running example again
//      WriteResult result = collection.remove(new BasicDBObject());
//      System.out.println(result.toString());

        //newConfig
        /*MongoClientURI connectionString = new MongoClientURI("mongodb://localhost:27017");
        MongoClient mongoClient = new MongoClient(connectionString);
        MongoDatabase database = mongoClient.getDatabase("stockdb");
        MongoCollection<Document> collection1 = database.getCollection("stock");*/

        parseJSON(collection, json);
        DBCursor cursor = collection.find();
        while(cursor.hasNext()) {
            System.out.println(cursor.next());
        }
    }
    private void parseJSON(DBCollection dbCollection, String json){
        DBObject dbObject = (DBObject) JSON.parse(json);
        dbCollection.insert(dbObject);
    }
}
