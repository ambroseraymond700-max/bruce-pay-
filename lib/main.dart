import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(const BrucePayApp());

class BrucePayApp extends StatelessWidget {
  const BrucePayApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: const Color(0xFF00C48A),
      ),
      home: const SplashScreen(),
    );
  }
}

// 1. SPLASH - We are Beyond Banking
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF00B386),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.account_balance_wallet, size: 80, color: Colors.white),
          SizedBox(height: 20),
          Text("We are Beyond Banking", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          Text("Licensed by CBN • Insured by NDIC", style: TextStyle(color: Colors.white70, fontSize: 10)),
        ]),
      ),
    );
  }
}

// 2. LOGIN WITH USERNAME / PASSWORD
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final user = TextEditingController(text: "Kaplan Bishop");
  final pass = TextEditingController(text: "123456");
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(width: 70, height: 70, decoration: BoxDecoration(color: const Color(0xFF00C48A), borderRadius: BorderRadius.circular(18)), child: const Icon(Icons.wallet, size: 40, color: Colors.white)),
          const SizedBox(height: 20),
          const Text("Welcome to Bruce Pay", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 30),
          TextField(controller: user, decoration: _dec("Username / Phone")),
          const SizedBox(height: 15),
          TextField(controller: pass, obscureText: hide, decoration: _dec("Password").copyWith(suffixIcon: IconButton(icon: Icon(hide ? Icons.visibility_off : Icons.visibility), onPressed: () => setState(() => hide = !hide)))),
          const SizedBox(height: 25),
          SizedBox(width: double.infinity, height: 50, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00C48A), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainApp())); }, child: const Text("Log In", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)))),
          const SizedBox(height: 15),
          const Text("Forgot Password?  |  Register", style: TextStyle(color: Color(0xFF00C48A))),
        ]),
      ),
    );
  }
  InputDecoration _dec(String l) => InputDecoration(labelText: l, filled: true, fillColor: const Color(0xFF1E1E1E), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)));
}

// 3. MAIN APP WITH 5 TABS
class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}
class _MainAppState extends State<MainApp> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [const HomePage(), const TransferPage(), const RewardsPage(), const CardsPage(), const MePage()][i],
      bottomNavigationBar: BottomNavigationBar(currentIndex: i, onTap: (v) => setState(() => i = v), backgroundColor: const Color(0xFF1E1E1E), type: BottomNavigationBarType.fixed, selectedItemColor: const Color(0xFF00C48A), unselectedItemColor: Colors.grey, items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: "Transfer"),
        BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "Rewards"),
        BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: "Cards"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me"),
      ]),
    );
  }
}

// HOME - EXACT LIKE YOUR VIDEO
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: ListView(padding: const EdgeInsets.all(12), children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Row(children: [const CircleAvatar(backgroundColor: Color(0xFF00C48A), child: Text("K")), const SizedBox(width: 8), const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Hi, Kaplan Bishop", style: TextStyle(fontWeight: FontWeight.bold)), Text("Welcome, Enjoy bonus!")])]), const Row(children: [Icon(Icons.headset_mic), SizedBox(width: 12), Icon(Icons.qr_code_scanner), SizedBox(width: 12), Icon(Icons.notifications)])]),
      const SizedBox(height: 12),
      // BALANCE CARD
      Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: const Color(0xFF00C48A), borderRadius: BorderRadius.circular(16)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text("Available Balance  👁", style: TextStyle(color: Colors.black54, fontSize: 12)), Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)), child: const Text("Transaction History >", style: TextStyle(fontSize: 10, color: Colors.white)))]),
        const SizedBox(height: 6),
        const Text("₦ 9,308.45", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black)),
        const SizedBox(height: 4),
        const Text("Cashback **** • OWealth **** • Bonus ****", style: TextStyle(fontSize: 10, color: Colors.black54)),
      ])),
      const SizedBox(height: 12),
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        _topBtn(context, Icons.send_to_mobile, "To OPay", const ToOPayPage()),
        _topBtn(context, Icons.account_balance, "To Bank", const ToBankPage()),
        _topBtn(context, Icons.savings, "Save", null),
        _topBtn(context, Icons.request_page, "Loan", null),
      ]),
      const SizedBox(height: 12),
      Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: const Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(16)), child: GridView.count(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisCount: 4, children: [
        _grid(context, Icons.phone_android, "Airtime", const AirtimePage()),
        _grid(context, Icons.wifi, "Data", const DataPage()),
        _grid(context, Icons.sports_soccer, "Betting", null),
        _grid(context, Icons.tv, "TV", null),
        _grid(context, Icons.lightbulb, "OWealth", null),
        _grid(context, Icons.credit_score, "Loan Center", null),
        _grid(context, Icons.emoji_events, "Refer & Earn", null),
        _grid(context, Icons.more_horiz, "More", null),
      ])),
      const SizedBox(height: 12),
      _promo("Plan Your Dream Christmas!", "Christmas Target - Save today, celebrate tomorrow"),
      const SizedBox(height: 8),
      _promo("Deposit & Claim up to 100% Coupon", "Sign-up, deposit and claim 100% bonus today"),
      const SizedBox(height: 8),
      _promo("Super Voucher Package", "Claim 15% discount on airtime"),
    ]));
  }
  static Widget _topBtn(BuildContext c, IconData ic, String t, Widget? page) => GestureDetector(onTap: () { if (page != null) Navigator.push(c, MaterialPageRoute(builder: (_) => page)); }, child: Column(children: [CircleAvatar(backgroundColor: const Color(0xFF1E1E1E), radius: 28, child: Icon(ic, color: const Color(0xFF00C48A))), const SizedBox(height: 4), Text(t, style: const TextStyle(fontSize: 11))]));
  static Widget _grid(BuildContext c, IconData ic, String t, Widget? page) => GestureDetector(onTap: () { if (page != null) Navigator.push(c, MaterialPageRoute(builder: (_) => page)); }, child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(ic, color: Colors.white70), const SizedBox(height: 4), Text(t, style: const TextStyle(fontSize: 11))]));
  static Widget _promo(String title, String sub) => Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: const Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(12)), child: Row(children: [const Icon(Icons.card_giftcard, color: Color(0xFF00C48A)), const SizedBox(width: 8), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)), Text(sub, style: const TextStyle(fontSize: 10, color: Colors.grey))])), ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00C48A), minimumSize: const Size(50, 30)), onPressed: () {}, child: const Text("Go", style: TextStyle(fontSize: 12))) ]));
}

// TRANSFER PAGES
class TransferPage extends StatelessWidget {
  const TransferPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Padding(padding: const EdgeInsets.all(16), child: Column(children: [
      const Text("Transfer", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      const SizedBox(height: 20),
      _tile(context, "To OPay Account", "Free, instant", Icons.send_to_mobile, const ToOPayPage()),
      _tile(context, "To Bank Account", "To all banks", Icons.account_balance, const ToBankPage()),
      _tile(context, "To Me", "Save to OWealth", Icons.savings, null),
    ])));
  }
  Widget _tile(BuildContext c, String t, String s, IconData ic, Widget? p) => ListTile(leading: CircleAvatar(backgroundColor: const Color(0xFF1E1E1E), child: Icon(ic, color: const Color(0xFF00C48A))), title: Text(t), subtitle: Text(s, style: const TextStyle(fontSize: 11)), trailing: const Icon(Icons.arrow_forward_ios, size: 14), onTap: () { if (p != null) Navigator.push(c, MaterialPageRoute(builder: (_) => p)); });
}

class ToOPayPage extends StatefulWidget { const ToOPayPage({super.key}); @override State<ToOPayPage> createState() => _ToOPayPageState(); }
class _ToOPayPageState extends State<ToOPayPage> {
  final ctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("To OPay Account"), backgroundColor: const Color(0xFF1E1E1E)), body: Padding(padding: const EdgeInsets.all(16), child: Column(children: [
      TextField(controller: ctrl, decoration: InputDecoration(labelText: "OPay Account / Phone", filled: true, fillColor: const Color(0xFF1E1E1E), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
      const SizedBox(height: 12),
      TextField(decoration: InputDecoration(labelText: "Amount ₦", filled: true, fillColor: const Color(0xFF1E1E1E), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
      const SizedBox(height: 20),
      SizedBox(width: double.infinity, height: 50, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00C48A)), onPressed: () => _success(context), child: const Text("Confirm"))),
    ])));
  }
}

class ToBankPage extends StatelessWidget {
  const ToBankPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("To Bank Account"), backgroundColor: const Color(0xFF1E1E1E)), body: Padding(padding: const EdgeInsets.all(16), child: Column(children: [
      DropdownButtonFormField(items: const [DropdownMenuItem(value: "GTB", child: Text("GTBank")), DropdownMenuItem(value: "ACCESS", child: Text("Access Bank")), DropdownMenuItem(value: "FIRST", child: Text("First Bank"))], onChanged: (v) {}, decoration: InputDecoration(labelText: "Select Bank", filled: true, fillColor: const Color(0xFF1E1E1E), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
      const SizedBox(height: 12),
      TextField(decoration: InputDecoration(labelText: "Account Number - 10 digits", filled: true, fillColor: const Color(0xFF1E1E1E), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
      const SizedBox(height: 12),
      TextField(decoration: InputDecoration(labelText: "Amount ₦", filled: true, fillColor: const Color(0xFF1E1E1E), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
      const SizedBox(height: 20),
      SizedBox(width: double.infinity, height: 50, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00C48A)), onPressed: () => _success(context), child: const Text("Confirm Transfer"))),
    ])));
  }
}

class AirtimePage extends StatelessWidget {
  const AirtimePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Airtime"), backgroundColor: const Color(0xFF1E1E1E)), body: Padding(padding: const EdgeInsets.all(16), child: Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [for (var n in ["MTN","GLO","Airtel","9Mobile"]) Chip(label: Text(n))]),
      const SizedBox(height: 12),
      TextField(decoration: InputDecoration(labelText: "Phone Number", filled: true, fillColor: const Color(0xFF1E1E1E), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
      const SizedBox(height: 12),
      Wrap(spacing: 8, children: [for (var a in ["₦100","₦200","₦500","₦1000"]) Chip(label: Text(a))]),
      const SizedBox(height: 20),
      SizedBox(width: double.infinity, height: 50, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00C48A)), onPressed: () => _success(context), child: const Text("Buy Airtime"))),
    ])));
  }
}

class DataPage extends StatelessWidget {
  const DataPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Data"), backgroundColor: const Color(0xFF1E1E1E)), body: ListView(padding: const EdgeInsets.all(16), children: [
      for (var d in ["1GB - ₦500 (7 days)", "2GB - ₦1000 (30 days)", "5GB - ₦2500 (30 days)", "10GB - ₦4000 (30 days)"])
        Card(color: const Color(0xFF1E1E1E), child: ListTile(title: Text(d), trailing: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00C48A)), onPressed: () => _success(context), child: const Text("Buy")), onTap: () => _success(context))),
    ]));
  }
}

class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Rewards")), body: ListView(padding: const EdgeInsets.all(16), children: [
    Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: const Color(0xFF00C48A), borderRadius: BorderRadius.circular(12)), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Cashback Balance", style: TextStyle(color: Colors.black54)), Text("₦ 21.50", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black))])),
    const SizedBox(height: 12),
    const ListTile(title: Text("Airtime Cashback - Up to 6%"), trailing: Icon(Icons.arrow_forward_ios, size: 12)),
    const ListTile(title: Text("Invite Friends - Win ₦7,200"), trailing: Icon(Icons.arrow_forward_ios, size: 12)),
  ]));
}

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Cards")), body: Padding(padding: const EdgeInsets.all(16), child: Column(children: [
    Container(height: 200, decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF00C48A), Color(0xFF00B386)]), borderRadius: BorderRadius.circular(16)), child: const Center(child: Text("Bruce Pay Verve Card\n**** **** **** 1234\nKAPLAN BISHOP", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)))),
    const SizedBox(height: 20),
    const ListTile(title: Text("Freeze Card"), leading: Icon(Icons.ac_unit)),
    const ListTile(title: Text("Change Pin"), leading: Icon(Icons.lock)),
  ])));
}

class MePage extends StatelessWidget {
  const MePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Me")), body: ListView(children: const [
    ListTile(leading: CircleAvatar(child: Text("K")), title: Text("Kaplan Bishop"), subtitle: Text("ID: 9031234567")),
    Divider(),
    ListTile(leading: Icon(Icons.history), title: Text("Transaction History")),
    ListTile(leading: Icon(Icons.settings), title: Text("Settings")),
    ListTile(leading: Icon(Icons.help), title: Text("Help Center")),
    ListTile(leading: Icon(Icons.logout, color: Colors.red), title: Text("Log Out", style: TextStyle(color: Colors.red))),
  ]));
}

void _success(BuildContext c) {
  showDialog(context: c, builder: (_) => AlertDialog(title: const Text("Success!"), content: const Text("Transaction Successful - Bruce Pay"), actions: [TextButton(onPressed: () => Navigator.pop(c), child: const Text("OK"))]));
}
