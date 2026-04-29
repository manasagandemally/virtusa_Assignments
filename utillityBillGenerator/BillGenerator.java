
import java.util.Scanner;
interface Billable {
    double calculateTotal(int units);
}

class BillGenerator implements Billable{
    public double calculateTotal(int units){
    if(units<=100){
        return units*1.0;
    }
    else if(units>100 && units<=300){
        return units*2.0;
    }
    else{
        return units*5.0;
    }
}
public static void main(String[] args){
Scanner sc=new Scanner(System.in);
BillGenerator obj=new BillGenerator();

while(true){
    System.out.println("\n===== SmartPay Utility Billing System =====\n");
    System.out.println("Enter customer name (or Exit):");
    String name=sc.nextLine();
    if(name.equalsIgnoreCase("Exit")) break;
    System.out.println("previous Reading: ");
    int prev=sc.nextInt();
    System.out.println("Current Reading: ");
    int curr=sc.nextInt();
    sc.nextLine(); 

    if(prev>curr){
        System.out.println("Invalid Input");
        continue;
    }

    int units=curr-prev;
    double total=obj.calculateTotal(units);
    double tax=total*0.1;

    System.out.println("\n=========== DIGITAL RECEIPT ===========");
    System.out.println("Customer Name:" +name);
    System.out.println("Units consumed: "+units);
    System.out.println("Tax: "+tax);
    System.out.println("----------------------------------------");
    System.out.println("Total: "+(total+tax));
}
}
}