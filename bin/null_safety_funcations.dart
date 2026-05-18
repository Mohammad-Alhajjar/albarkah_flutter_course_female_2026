// ignore_for_file: prefer_function_declarations_over_variables

void main() {
  // ? Null Safety
  int? counter;
  // int sum = 10 + counter!; // ! exception

  int result = 10 + (counter ?? 0); // ! plan B for counter value
  print(result);

  List? users;
  // users = ["Ahmad", "Mhd", "noor"];

  print(users?.length);
  // print(users!.length);

  // ---------------------------------------------------------------
  // ? Funations

  addTwoNumbersWithNonReturnValue(10, 20);
  addTwoNumbersWithNonReturnValue(22, 33);

  // print(addTwoNumbersWithReturnedValue(20, 20));

  int sum = addTwoNumbersWithReturnedValue(20, 20);
  print(sum);

  double dResult = divideTwoNumbers(10, 5);
  print(dResult);

  dResult = divideTwoNumbersWithRequiredNumberParams(
    secondNumber: 5,
    firstNumber: 10,
  );
  print(dResult);

  num mResult = multiplyTwoOrThreeNumbersWithNumbedParams(
    firstNumber: 10,
    secondNumber: 10,
    thirdNumber: 20,
  );
  print(mResult);

  mResult = multiplyTwoOrThreeNumbersWithUNumbedParams(20, 3, 20);
  print(mResult);

  // ---------------------------------------------------------------
  // ! Function as a Type and Variable

  test();

  // ignore: prefer_function_declarations_over_variables
  Function fun = () {
    print("تابع مجهول بدون اسم");
  };

  fun();

  Function(String, String) userRegister = (String email, String password) {
    print("bayan wants more than one line");
    print("User Registered with email: $email, password: $password");
  };

  // userRegister(email: "mohammad@email.com", password: "123456");

  userRegister("mohammad@email.com", "mhd124578");

  Function(String, String) userRegitserCopy = userRegister;

  userRegitserCopy("noor@gmail.com", "noor 123456789");

  num calResult = calculator(10, 20, (int x, int y) {
    return x - y;
  });

  print(calResult);

  calResult = calculator(40, 60, addTwoNumbersWithReturnedValue);
  print(calResult);
}

void test() {
  print("test");
}

void addTwoNumbersWithNonReturnValue(int firstNumber, int secondNumber) {
  int sum = firstNumber + secondNumber;
  print(sum);
}

int addTwoNumbersWithReturnedValue(int firstNumber, int secondNumber) {
  int sum = firstNumber + secondNumber;
  return sum;
}

double divideTwoNumbers(int firstNumber, int secondNumber) {
  double divideResult = firstNumber / secondNumber;
  print("call from positional paramerts");
  return divideResult;
}

double divideTwoNumbersWithRequiredNumberParams({
  required int firstNumber,
  required int secondNumber,
}) {
  double divideResult = firstNumber / secondNumber;
  print("call from required named paramerts");
  return divideResult;
}

num multiplyTwoOrThreeNumbersWithNumbedParams({
  required int firstNumber,
  required int secondNumber,
  int? thirdNumber,
}) {
  num multiReslut = firstNumber * secondNumber * (thirdNumber ?? 1);

  // if (thirdNumber != null) {
  //   int multiReslut = firstNumber * secondNumber * thirdNumber;
  // }else{
  //   int multiReslut = firstNumber * secondNumber;
  // }

  return multiReslut;
}

double multiplyTwoOrThreeNumbersWithUNumbedParams(
  double firstNumber,
  double secondNumber, [
  double thirdNumber = 1,
]) {
  double multiReslut = firstNumber * secondNumber * thirdNumber;

  return multiReslut;
}

num calculator(int a, int b, Function(int, int) operation) {
  num result = operation(a, b);
  return result;
}
