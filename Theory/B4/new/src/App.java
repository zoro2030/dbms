//package test;


import java.net.UnknownHostException;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import com.mongodb.MongoException;


public class App {
      public static void main(String[] args) {
 
    try {
 
	/**** Connect to MongoDB ****/
	MongoClient mongo = new MongoClient("localhost", 27017);
 
	/**** Get database ****/
	DB db = mongo.getDB("demo");
 
	/**** Get collection / table from 'demo' ****/
	DBCollection table = db.getCollection("user");
 
	/**** Insert ****/
	BasicDBObject doc = new BasicDBObject();
	doc.put("NAME", "ABHINAV");
	doc.put("AGE", 25);
	table.insert(doc);
	BasicDBObject doc1 = new BasicDBObject();
	doc1.put("NAME", "SAI");
	doc1.put("AGE", 27);
	table.insert(doc1);
	
	/**** Display ****/
	System.out.println(doc);
	System.out.println(doc1);
 
	/**** Update ****/
	BasicDBObject newdoc = new BasicDBObject();
	newdoc.put("NAME", "AVCOE");
 
	BasicDBObject newdoc1 = new BasicDBObject();
	newdoc1.put("NAME", "AMRUTVAHINI");
 
	BasicDBObject updatedoc = new BasicDBObject();
	updatedoc.put("set", newdoc1);
	table.insert(updatedoc);
 
	table.update(newdoc,updatedoc);
	System.out.println(updatedoc);
	/**** Remove****/
	
	table.remove(doc1);
	
   
	/**** Done ****/
	System.out.println("Done");
 
    } catch (UnknownHostException e) {
	e.printStackTrace();
    } catch (MongoException e) {
	e.printStackTrace();
    }
 
  }
}
