/// This enum is used to parameter the list of the authentication mode
///
/// Most of apps try to not force user to create an account to access the app
/// But you may want to force the user to be authenticated to access the app
enum AuthenticationMode {
  /// By default the user will be authenticated anonymously
  /// This means that the user can access your app without login
  /// He will be able to link his account later to an email or social login
  anonymous,

  /// The user requires to be authenticated to access the app
  /// By default the user won't have any identity
  authRequired,
}
