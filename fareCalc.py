# The "Fare Calc" Travel Optimizer

def calculate_fare(km, type, hour):
    rates= {
        'ECONOMY': 10,
        'PREMIUM': 18,
        'SUV': 25
    }
    
    fare= km * rates[type]
    if 17<=hour<=20:
        multiplier=1.5
    else:
        multiplier=1
    final_fare= fare*multiplier
    
    return final_fare

try:
    km= float(input("Enter distance in km: "))
    type= input("choose a vehicle type (economy/Premium/SUV): ").upper()
    rates={'ECONOMY', 'PREMIUM', 'SUV'}
    if type not in rates:
        print("Vehicle service not available.")
        exit()
    hour= int(input("enter hour of travel (0-23): "))
    result= calculate_fare(km, type, hour)
    print("Total fare of travel: ")
    if result is None:
        print(result)
    else:
        print("Distance:", km, "km")
        print("vehicle type:", type)
        print("hour:", hour)

        if(17<=hour<=20):
            print("Surge Applied : YES (1.5x)")
        else:
            print("NO Surge Applied")

        print("Total Fare: ", round(result,2))

except:
    print("Invalid Input")