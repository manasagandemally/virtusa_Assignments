# The "Fare Calc" Travel Optimizer

def calculate_fare(km, veh_type, hour):
    
    fare= km * rates[veh_type]
    if 17<=hour<=20:
        multiplier=1.5
    else:
        multiplier=1
    final_fare= fare*multiplier
    return final_fare

try:
    print("\n---- CityCab Fare Calculator ----\n")

    km= float(input("Enter distance in km: "))
    veh_type= input("choose a vehicle type (ECONOMY/PREMIUM/SUV): ").upper()
    rates={'ECONOMY': 10, 'PREMIUM': 18, 'SUV': 25}

    if veh_type not in rates:
        print("Vehicle service not available.")
        exit()
    hour= int(input("enter hour of travel (0-23): "))
    if not (0 <= hour <= 23):
        print("Hour must be between 0 and 23.")
        exit()

    result= calculate_fare(km, veh_type, hour)
    print("\n---- Total Fare Receipt ----\n")
    print("Distance:", km, "km")
    print("vehicle type:", veh_type)
    print("hour:", hour)


    if(17<=hour<=20):
        print("Surge Applied : YES (1.5x)")
    else:
        print("NO Surge Applied")

    print("Total Fare: ", round(result,2))
except:
    print("Invalid Input")