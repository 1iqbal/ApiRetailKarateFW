package tests;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

import com.ibm.icu.impl.duration.TimeUnit;
import com.ibm.icu.text.SimpleDateFormat;
import net.datafaker.Faker;

public class DataGenerator {
//public static void main(String[] args) {
//	
//	System.out.println(data("cardNumber"));
//	System.out.println(data("getNameOnCard"));
//	System.out.println(data("getExpirationMonth"));
//	System.out.println(data("getExpirationYear"));
//	System.out.println(data("getSecurityCode"));
//
//}
//public static String data(String input) {
//	
//	Faker faker = new Faker();
//	String outPut = "";
//	if(input.equals("getCardNumber")) {
//		outPut = faker.expression("#{numerify '1#############16'}");
//	} else if (input.equals("getNameOnCard")) {
//		outPut = faker.name().fullName();
//    } else if (input.equals("getExpirationMonth")) {
//	    outPut = faker.expression("#{date.birthday 'mm'}");
//    } else if (input.equals("getExpirationYear")) {
//	   outPut = faker.expression("#{date.birthday 'yyyy'}");
//    } else if (input.equals("getSecurityCode")) {
//	   outPut = faker.expression("#{numerify '1##'}");
//    }
//	return outPut;
//}
//}

	/**
	 * In Karate we can call Java Methods
	 * each methods should be static 
	 * for each data type we need to generate separate methods
	 */
	public static String getEmail() {
		Faker faker = new Faker();
		String email = faker.name().firstName()+faker.name().lastName()+"@tekschool.us";
		return email;
	}
	public static String getFirstName() {
		Faker faker = new Faker();
		return faker.name().firstName();
	}
	public static String getLastName() {
		Faker faker = new Faker();
		return faker.name().lastName();
	}
	public static String getTitle() {
		Faker faker = new Faker();
		return faker.name().prefix().toUpperCase();
	}
	public static String getDOB() {
		Faker faker = new Faker();
		Date date = faker.date().birthday();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(date);
	}
//	public static int getCardNumber() {
//		Faker faker = new Faker();
//		return faker.number().randomDigit();
//	}
	public static String getGender() {
		Faker faker = new Faker();
		return faker.dog().gender().toUpperCase();
	}
	public static String getEmploymentStatus() {
		Faker faker = new Faker();
		return faker.job().position();
	}
	public static String getMaritalStatus() {
		ArrayList<String> maritalStatus = new ArrayList<String>();
		maritalStatus.add("SINGLE");
		maritalStatus.add("MARRIED");
		maritalStatus.add("DIVORCED");
		maritalStatus.add("WIDOW");
		maritalStatus.add("WIDOWER");
		Collections.shuffle(maritalStatus);
		return maritalStatus.get(0);
	}
	public static String getCardNumber() {
		Faker faker = new Faker();
		return faker.expression("#{numerify '1#############16'}");
	}
	public static String getNameOnCard() {
		Faker faker = new Faker();
		return faker.name().fullName();
	}
	public static String getExpirationMonth() {
		Faker faker = new Faker();
		return faker.expression("#{letterify '####'}");
	}
	public static String getExpirationYear() {
		Faker faker = new Faker();
		Date date = faker.date().birthday();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(date);
	}
	public static String getSecurityCode() {
		Faker faker = new Faker();
		return faker.expression("#{numerify '1##'}");
	}
	
public static String getCountry() {
	Faker faker = new Faker();
	return faker.address().country();
}

public static String getFullName() {
Faker faker = new Faker();
return faker.name().fullName();
}
public static String getPhoneNumber() {
	Faker faker = new Faker();
	return faker.phoneNumber().phoneNumber();
}
public static String getStreet() {
	Faker faker = new Faker();
	return faker.address().streetAddress();
}
public static String getApartment() {
	Faker faker = new Faker();
	return faker.address().buildingNumber();
}
public static String getCity() {
	Faker faker = new Faker();
	return faker.address().city();
}
public static String getState() {
	Faker faker = new Faker();
	return faker.address().state();
}
public static String getZipCode() {
	Faker faker = new Faker();
	return faker.address().postcode();
}
public static String getDateFarmats() {
	Faker faker = new Faker();
	return faker.expression("#{date.future '15','SECONDS','dd/MM/yyyy hh:mm:ss'}");
}
public static String getDateYear() {
	Faker faker = new Faker();
	return faker.expression("#{date.future 'yyyy'}");
}
}