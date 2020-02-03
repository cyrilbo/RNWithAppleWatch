import Foundation
import WatchKit
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {
  @IBOutlet weak var textToDisplay: WKInterfaceLabel!
   var session: WCSession?
  
  override func awake(withContext context: Any?) {
    super.awake(withContext: context)
    if WCSession.isSupported() {
      self.session = WCSession.default
      self.session?.delegate = self
      self.session?.activate()
    }
  }
  
  func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    print("An error occured")
  }
  
  func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
    print("watch received message", message);
    let text = message["message"] as? String
    self.textToDisplay.setText(text)
  }
}
