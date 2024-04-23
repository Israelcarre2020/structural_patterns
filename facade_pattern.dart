class InventorySystem {
  bool checkSeat(String showId, int seatNumber) {
    return true;
  }
}

class PaymentSystem {
  bool processPayment(double amount) {
    return true;
  }
}

class EmailService {
  void sendConfirmation(String email, String message) {
    print('Sending email to $email: $message');
  }
}

class TicketFacade {
  final InventorySystem _inventory = InventorySystem();
  final PaymentSystem _payment = PaymentSystem();
  final EmailService _email = EmailService();

  void purchaseTicket(
      String userEmail, String showId, int seatNumber, double price) {
    if (_inventory.checkSeat(showId, seatNumber)) {
      if (_payment.processPayment(price)) {
        _email.sendConfirmation(userEmail, 'Your ticket has been purchased.');
      }
    }
  }
}

void main() {
  var ticketFacade = TicketFacade();
  ticketFacade.purchaseTicket('user@example.com', 'show123', 12, 10.0);
}
