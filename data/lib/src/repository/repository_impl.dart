import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartx/dartx.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../data.dart';

@LazySingleton(as: Repository)
class RepositoryImpl implements Repository {
  RepositoryImpl(
    this._appApiService,
    this._appPreferences,
    this._appDatabase,
    this._preferenceUserDataMapper,
    this._userDataMapper,
    this._languageCodeDataMapper,
    this._genderDataMapper,
    this._localUserDataMapper,
    this._apiTableDataMapper,
    this._apiListCategoriesDataMapper,
    this._apiListMenuDataMapper,
    this._apiTableOrderDataMapper,
    this._apiTableOrderGetDataMapper,
    this._apiDeviceDataMapper,
    this._apiListDevicesDataMapper,
    this._apiEmployeeHandleOrderDataMapper
  );

  final AppApiService _appApiService;
  final AppPreferences _appPreferences;
  final AppDatabase _appDatabase;
  final PreferenceUserDataMapper _preferenceUserDataMapper;
  final ApiUserDataMapper _userDataMapper;
  final LanguageCodeDataMapper _languageCodeDataMapper;
  final GenderDataMapper _genderDataMapper;
  final LocalUserDataMapper _localUserDataMapper;
  final ApiTableDataMapper _apiTableDataMapper;
  final ApiListCategoriesDataMapper _apiListCategoriesDataMapper;
  final ApiListMenuDataMapper _apiListMenuDataMapper;
  final ApiTableOrderDataMapper _apiTableOrderDataMapper;
  final ApiTableOrderGetDataMapper _apiTableOrderGetDataMapper;
  final ApiDeviceDataMapper _apiDeviceDataMapper;
  final ApiListDevicesDataMapper _apiListDevicesDataMapper;
  final ApiEmployeeHandleOrderDataMapper _apiEmployeeHandleOrderDataMapper;

  @override
  bool get isLoggedIn => _appPreferences.isLoggedIn;

  @override
  bool get isFirstLogin => _appPreferences.isFirstLogin;

  @override
  bool get isFirstLaunchApp => _appPreferences.isFirstLaunchApp;

  @override
  Stream<bool> get onConnectivityChanged =>
      Connectivity().onConnectivityChanged.map((event) => event != ConnectivityResult.none);

  @override
  bool get isDarkMode => _appPreferences.isDarkMode;

  @override
  LanguageCode get languageCode =>
      _languageCodeDataMapper.mapToEntity(_appPreferences.languageCode);

  @override
  Future<bool> saveIsFirstLogin(bool isFirstLogin) {
    return _appPreferences.saveIsFirstLogin(isFirstLogin);
  }

  @override
  Future<bool> saveIsFirstLaunchApp(bool isFirstLaunchApp) {
    return _appPreferences.saveIsFirsLaunchApp(isFirstLaunchApp);
  }

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    final response = await _appApiService.login(email: email, password: password);
    await Future.wait([
      saveAccessToken(response?.data?.accessToken ?? ''),
      saveUserPreference(
        User(
          id: response?.data?.id ?? -1,
          email: response?.data?.email ?? '',
        ),
      ),
    ]);
  }

  @override
  Future<void> logout() async {
    // await _appApiService.logout();
    await _appPreferences.clearCurrentUserData();
  }

  @override
  Future<void> resetPassword({
    required String token,
    required String email,
    required String password,
    required String confirmPassword,
  }) =>
      _appApiService.resetPassword(
        token: token,
        email: email,
        password: password,
      );

  @override
  Future<void> forgotPassword(String email) => _appApiService.forgotPassword(email);

  @override
  Future<void> register({
    required String username,
    required String email,
    required String password,
    required Gender gender,
  }) async {
    final response = await _appApiService.register(
      username: username,
      email: email,
      password: password,
      gender: _genderDataMapper.mapToData(gender),
    );
    await Future.wait([
      saveAccessToken(response?.data?.accessToken ?? ''),
      saveUserPreference(
        User(
          id: response?.data?.id ?? -1,
          email: response?.data?.email ?? '',
        ),
      ),
    ]);
  }

  @override
  User getUserPreference() => _preferenceUserDataMapper.mapToEntity(_appPreferences.currentUser);

  @override
  Future<void> clearCurrentUserData() => _appPreferences.clearCurrentUserData();

  @override
  Future<MListTable> getTables() async {
    final response = await _appApiService.getTables();
    return _apiTableDataMapper.mapToEntityList(response);
  }

  @override
  Future<bool> saveLanguageCode(LanguageCode languageCode) {
    return _appPreferences.saveLanguageCode(_languageCodeDataMapper.mapToData(languageCode));
  }

  @override
  Future<bool> saveIsDarkMode(bool isDarkMode) => _appPreferences.saveIsDarkMode(isDarkMode);

  @override
  Future<User> getMe() async {
    final response = await _appApiService.getMe();

    return _userDataMapper.mapToEntity(response);
  }

  @override
  int deleteAllUsersAndImageUrls() {
    return _appDatabase.deleteAllUsersAndImageUrls();
  }

  @override
  bool deleteImageUrl(int id) {
    return _appDatabase.deleteImageUrl(id);
  }

  @override
  User? getLocalUser(int id) {
    return _localUserDataMapper.mapToEntity(_appDatabase.getUser(id));
  }

  @override
  List<User> getLocalUsers() {
    return _localUserDataMapper.mapToListEntity(_appDatabase.getUsers());
  }

  @override
  Stream<List<User>> getLocalUsersStream() {
    return _appDatabase
        .getUsersStream()
        .map((event) => _localUserDataMapper.mapToListEntity(event));
  }

  @override
  int putLocalUser(User user) {
    final userData = _localUserDataMapper.mapToData(user);

    return _appDatabase.putUser(userData);
  }

  @override
  Future<void> saveAccessToken(String accessToken) => _appPreferences.saveAccessToken(accessToken);

  @override
  Future<bool> saveUserPreference(User user) =>
      _appPreferences.saveCurrentUser(_preferenceUserDataMapper.mapToData(user));

  @override
  Future<ListCategories> getCategory() async {
    final response = await _appApiService.getCategory();
    return _apiListCategoriesDataMapper.mapToEntity(response);
  }

  @override
  Future<ListMenu> getItemMenu() async {
    final response = await _appApiService.getItemMenu();
    return _apiListMenuDataMapper.mapToEntity(response);
  }

  @override
  Future<User> postUser(String email,String password) async {
    final response = await _appApiService.postUser(email,password);
    if(response!.userData!.name.isNotNullOrEmpty){
      await _appPreferences.saveAccessToken(response.accessToken ?? '');
      await saveUserPreference(
        User(
          id: response.userData?.id ?? 0
        ),
      );
    }
    return _userDataMapper.mapToEntity(response.userData);
  }

  @override
  Future<TableOrderGet> getOderGuest(int tableId) async {
    final response = await _appApiService.getOderGuest(tableId);
    return _apiTableOrderGetDataMapper.mapToEntity(response);
  }

  @override
  Future<TableOrder> postTableOrder(int tableId,TableOrder tableOrder) async {
    final response = await _appApiService.postTableOrder(tableId,_apiTableOrderDataMapper.mapToData(tableOrder));
    return _apiTableOrderDataMapper.mapToEntity(response);
  }

  @override
  Future<void> deleteUser(int tableId) async {
    await _appApiService.deleteUser(tableId);
  }

  @override
  Future<void> updateTableStatus(int tableId,int status) async {
    await _appApiService.updateTableStatus(tableId,status);
  }

  @override
  Future<Device> createDevicesToken(String devicesToken) async {
    final response = await _appApiService.postDeviceToken(devicesToken);
    return _apiDeviceDataMapper.mapToEntity(response);
  }

  @override
  Future<ListDevice> getDevices() async {
    final response = await _appApiService.getDevices();
    return _apiListDevicesDataMapper.mapToEntity(response);
  }

  @override
  Future<void> postNoti(String token, int tableId) async {
    await _appApiService.postNoti(token,tableId);
  }

  @override
  Future<String?> postPayment(int amount) async {
    final _response = await _appApiService.postPayment(amount);
    return _response?.value('location');
  }

  @override
  Future<void> postEmployeeHandleOrder(EmployeeHandleOrder employeeHandleOrder) async {
    await _appApiService.postEmployeeHandleOrder(_apiEmployeeHandleOrderDataMapper.mapToData(employeeHandleOrder));
  }
}
