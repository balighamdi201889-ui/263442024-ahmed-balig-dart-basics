// Student: balig hamdi badri ahmed
// Reg no: 26344/2024
const String regNo = '26344/2024';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// by b.h.b.a
int momoFee(int amount) {
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// by b.h.b.a
String formatRwf(int amount) {
  String str = amount.abs().toString();
  String result = '';
  int count = 0;
  int i = str.length - 1;
  
  while (i >= 0) {
    result = str[i] + result;
    count++;
    if (count == 3 && i != 0) {
      result = ',' + result;
      count = 0;
    }
    i--;
  }
  
  if (amount < 0) {
    result = '-' + result;
  }
  return result + ' RWF';
}

// by b.h.b.a
bool isValidPin(String pin) {
  if (pin.length != 5) return false;
  if (pin == '12345') return false;
  
  int i = 0;
  bool allSame = true;
  bool allDigits = true;
  
  while (i < pin.length) {
    int charCode = pin.codeUnitAt(i);
    if (charCode < 48 || charCode > 57) {
      allDigits = false;
    }
    if (i > 0 && pin[i] != pin[0]) {
      allSame = false;
    }
    i++;
  }
  
  if (!allDigits) return false;
  if (allSame) return false;
  return true;
}

// by b.h.b.a
int sendMoney(int balance, int amount) {
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  
  int newBalance = balance - (amount + fee);
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

// by b.h.b.a
int buyAirtime(int balance, int amount) {
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  
  int newBalance = balance - amount;
  print('Bought ${formatRwf(amount)} airtime. New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

// by b.h.b.a
void main() {
  print('Reg no: $regNo | D=$d | T=$t');
  
  // 1. Print isValidPin calls
  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));
  print(isValidPin('4821$d')); 
  
  // 2. Starting balance
  int balance = 20000 + (t * 500); 
  print('Starting balance: ${formatRwf(balance)}');
  
  // 3. Transactions
  balance = sendMoney(balance, (d + 1) * 3000); 
  balance = sendMoney(balance, (d + 1) * 3000); 
  balance = sendMoney(balance, (d + 1) * 3000); 
  
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);
  
  // 4. Final balance
  print('Final balance: ${formatRwf(balance)}');
  
  // 5. Custom Test Calls
  print('\n--- Custom Tests ---');
  print(formatRwf(1000000)); // Expected: 1,000,000 RWF
  print(formatRwf(-50));     // Expected: -50 RWF
  print(isValidPin('00000'));// Expected: false
  print(isValidPin('1234')); // Expected: false
  print(isValidPin('00123'));// Expected: true (Breaking case consideration: leading zeros in strings)
}