// Student: balig hamdi badri ahmed
// Reg no: 26344/2024
const String regNo = '26344/2024';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// ==========================================
// Part B2
// ==========================================
// by b.h.b.a
int countVowels(String text) {
  int count = 0;
  String lowerText = text.toLowerCase();
  for (int i = 0; i < lowerText.length; i++) {
    String char = lowerText[i];
    if (char == 'a' || char == 'e' || char == 'i' || char == 'o' || char == 'u') {
      count++;
    }
  }
  return count;
}

// ==========================================
// Part B3
// ==========================================
// by b.h.b.a
String initials(String fullName) {
  String result = '';
  int i = 0;
  bool newWord = true;
  
  if (fullName.trim().isEmpty) return '';

  while (i < fullName.length) {
    String char = fullName[i];
    if (char == ' ') {
      newWord = true;
    } else if (newWord) {
      result += char.toUpperCase() + '.';
      newWord = false;
    }
    i++;
  }
  return result;
}

// ==========================================
// Part C5
// ==========================================
// by b.h.b.a
void drawTriangle(int height) {
  if (height <= 2) return;
  int row = 1;
  while (row <= height) {
    int spaces = height - row;
    String line = '';
    
    int s = 0;
    while (s < spaces) {
      line += ' ';
      s++;
    }
    
    String symbol = (row % 2 == 1) ? '*' : '#';
    int c = 0;
    while (c < row) {
      line += symbol;
      c++;
    }
    print(line);
    row++;
  }
}

// ==========================================
// Part D2: MoMo receipt printer
// ==========================================
// by b.h.b.a
int momoFee(int amount) {
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// by b.h.b.a
String maskPhone(String phone) {
  if (phone.length != 10) return 'INVALID';
  return phone.substring(0, 3) + '*****' + phone.substring(8);
}

// ==========================================
// Part E: Find and fix
// ==========================================
// by b.h.b.a
String grade(int mark) {
  if (mark >= 80) {
    return 'A';
  } else if (mark >= 70) {
    return 'B';
  } else if (mark >= 50) {
    return 'C';
  }
  return 'F';
}

// by b.h.b.a
bool isPalindrome(String word) {
  int i = 0;
  String lowerWord = word.toLowerCase();
  while (i < lowerWord.length) {
    if (lowerWord[i] != lowerWord[lowerWord.length - 1 - i]) return false;
    i++;
  }
  return true;
}

// ==========================================
// Main Function
// ==========================================
// by b.h.b.a
void main() {
  print('Reg no: $regNo | D=$d | T=$t\n');
  
  // B2
  String fullName = 'balig hamdi badri ahmed';
  int vowels = countVowels(fullName);
  print('$fullName has $vowels vowels\n');

  // B3
  print(initials(fullName));
  print(initials('   ana uwase   '));
  print(initials('   '));

  // C5
  drawTriangle(d + 3);
  drawTriangle(-1);
  drawTriangle(2);

  // D2
  int i = 1;
  int limit = d + 3;
  int totalFees = 0;
  String phone = maskPhone('0788123456');

  while (i <= limit) {
    int amount = (i * 4000) + (t * 100);
    int fee = momoFee(amount);
    totalFees += fee;
    print('Receipt $i $amount RWF | fee $fee RWF | to $phone');
    i++;
  }
  print('Total fees: $totalFees RWF');
}