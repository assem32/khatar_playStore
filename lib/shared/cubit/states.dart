abstract class KhatarStates{}

class AppInitialState extends KhatarStates{}

class AppLoadingState extends KhatarStates{}

class AppErrorState extends KhatarStates{
  final String error;
  AppErrorState(this.error);
}

class AppSuccessState extends KhatarStates{}

class AppCreatePhotoSession extends KhatarStates{}

class AppCreatePhotoErrorSession extends KhatarStates{
  final String error;
  AppCreatePhotoErrorSession(this.error);
}

class SocialCreateUserSuccessState extends KhatarStates{}

class SocialCreateUserErrorState extends KhatarStates{
  final String error;
  SocialCreateUserErrorState(this.error);
}
class ReservationSuccessState extends KhatarStates{}

class CourseSuccessState extends KhatarStates{}

class BirthdaySuccessState extends KhatarStates{}

class PhotoSessionSuccessState extends KhatarStates{}

class GetMap extends KhatarStates{}

class GetPhotoSession extends KhatarStates{}

class SignOutSuccessState extends KhatarStates{}

class SignOutErrorState extends KhatarStates{}

