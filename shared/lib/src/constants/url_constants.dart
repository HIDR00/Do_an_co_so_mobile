import '../../shared.dart';

class UrlConstants {
  const UrlConstants._();

  /// Url
  // static const termUrl = 'https://www.chatwork.com/';
  // static const lineApiBaseUrl = 'https://api.line.me/';
  // static const twitterApiBaseUrl = 'https://api.twitter.com/';
  // static const goongApiBaseUrl = 'https://rsapi.goong.io/';
  static const firebaseNotificationBaseUrl = 'https://fcm.googleapis.com/v1/projects/food-notification-36a91/messages:send';

  static const paymentBaseUrl = 'https://sandbox.vnpayment.vn/tryitnow/Home/CreateOrder';
  // static const randomUserBaseUrl = 'https://randomuser.me/api/';

  // static const mockApiBaseUrl = 'https://api.jsonbin.io/';

  /// Path
  // static const remoteConfigPath = '/config/RemoteConfig.json';
  // static const settingsPath = '/mypage/settings';


  static String get appApiBaseUrl {
    switch (EnvConstants.flavor) {
      case Flavor.develop:
        return EnvConstants.authApiUrl;
      case Flavor.qa:
        return '';
      case Flavor.staging:
        return '';
      case Flavor.production:
        return '';
    }
  }
}
