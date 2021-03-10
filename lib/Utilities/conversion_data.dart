List<String> lengthUnits = ["metre","kilometre","centimetre","millimetre","micrometre","nanometre","feet","inch","yard",
  "mile","nautical mile","light year","lunar distance","parsec","astronomical unit"];
List<String> massUnits = ["kilogramme","gramme","milligramme","microgramme","tonne","pound","quintal","ounce","carat","stone"];
List<String> timeUnits = ["second", "millisecond", "microsecond", "minute", "hour", "day", "week", "year"];
List<String> areaUnits = ["square metre","square km", "square cm", "square mm", "micron", "hectare","acre","square mile","square foot","square inch"];
List<String> volumeUnits = ["cubic m", "cubic cm", "cubic mm", "hectolitre","litre", "centilitre", "millilitre","cubic inch","cubic yard","cubic feet","acre-foot"];
List<String> temperatureUnits = ["celcius", "fahrenheit", "kelvin"];
List<String> speedUnits = ["kmps","m/s","kmph","mach","knot","mph","fps","inch/s","light speed"];
List<String> baseUnits = ["decimal","binary","octal","hexadecimal"];

List<String> getList(String type){
  if(type == "Length")
    return lengthUnits;
  else if(type == "Mass")
    return massUnits;
  else if(type == "Time")
    return timeUnits;
  else if(type == "Area")
    return areaUnits;
  else if(type == "Volume")
    return volumeUnits;
  else if(type == "Temperature")
    return temperatureUnits;
  else if(type == "Speed")
    return speedUnits;
  else
    return baseUnits;
}

var conversionFactors = {
  "kilometre" : 1000,
  "metre" : 1,
  "centimetre" : 0.01,
  "millimetre" : 0.001,
  "micrometre" : 1e-6,
  "nanometre" : 1e-9,
  "nautical mile" : 1852,
  "mile" : 1609.344,
  "yard" : 0.9144,
  "feet" : 0.3048,
  "inch" : 0.0254,
  "parsec" : 3.08567758e16,
  "lunar distance" : 384401000,
  "astronomical unit" : 1.49597871e11,
  "light year" : 9.46073047e15,

  "second" : 1,
  "millisecond" : 0.001,
  "microsecond" : 1e-6,
  "minute" : 60,
  "hour" : 3600,
  "day" : 86400,
  "week" : 604800,
  "year" : 31536000,

  "kilogramme" : 1,
  "gramme" : 0.001,
  "milligramme" : 1e-6,
  "microgramme" : 1e-9,
  "tonne" : 1000,
  "pound" : 0.45359237,
  "quintal" : 100,
  "ounce" : 0.0283495231,
  "carat" : 0.0002,
  "stone" : 0.157473044,

  "square metre" : 1,
  "square km" : 1e6,
  "square cm" : 0.0001,
  "square mm" : 1e-6,
  "micron" : 1e-12,
  "hectare" : 10000,
  "acre" : 4046.856,
  "square mile" : 2589988.11,
  "square foot" : 0.09290304,
  "square inch" : 0.00064516,

  "cubic m" : 1,
  "cubic cm" : 1e-6,
  "cubic mm" : 1e-9,
  "hectolitre" : 0.1,
  "litre" : 0.001,
  "centilitre" : 1e-5,
  "millilitre" : 1e-6,
  "cubic inch" : 1.6387064e-5,
  "cubic yard" : 0.764554858,
  "cubic feet" : 0.0283168466,
  "acre-foot" : 1234,

  "kmps" : 1000,
  "m/s" : 1,
  "kmph" : 0.277777778,
  "mach" : 340.3,
  "knot" : 0.514444444,
  "mph" : 0.44704,
  "fps" : 0.3048,
  "inch/s" : 0.0254,
  "light speed" : 299792458
};

String convert(String type, String srcUnit, String destUnit, String inputValue){

  if(type == "Base"){

    int baseTemp;
    if(srcUnit == "binary")
      baseTemp = int.parse(inputValue, radix: 2);
    else if(srcUnit == "hexadecimal")
      baseTemp = int.parse(inputValue, radix: 16);
    else if(srcUnit == "octal")
      baseTemp = int.parse(inputValue, radix: 8);
    else
      baseTemp = int.parse(inputValue);

    String baseRet;

    if(destUnit == "binary")
      baseRet = baseTemp.toRadixString(2);
    else if(destUnit == "hexadecimal")
      baseRet = baseTemp.toRadixString(16);
    else if(destUnit == "octal")
      baseRet = baseTemp.toRadixString(8);
    else
      baseRet = baseTemp.toRadixString(10);
    return baseRet;
  }
  else if(type == "Temperature"){

    double value = double.parse(inputValue);
    if(srcUnit == "fahrenheit")
      value = (value - 32) / 1.8;
    else if(srcUnit == "kelvin")
      value = value - 273.15;
    if(destUnit == "kelvin")
      value = value + 273.15;
    else if(destUnit == "fahrenheit")
      value = value * 1.8 + 32;
    return value.toStringAsFixed(6);
  }
  else{
    double value = double.parse(inputValue);
    value = value * conversionFactors[srcUnit] * (1 / conversionFactors[destUnit]);
    if(value == 0)
      return "0";
    if(value < 1e-5)
      return value.toStringAsExponential(6);
    else
      return value.toStringAsFixed(6);
  }
}