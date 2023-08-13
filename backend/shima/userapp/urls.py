from django.urls import path,include
from rest_framework.routers import DefaultRouter
from userapp.views import UserViewSet ,RegistrationView,LoginView,UsersAPIView,LeaveApplicationCreateView, LeaveApplicationViewSet,RefreshTokenView
# from dj_rest_auth.registration.views import VerifyEmailView,ConfirmEmailView
router = DefaultRouter()
router.register(r'user', UserViewSet),
router.register(r'leave-applications',  LeaveApplicationViewSet),
urlpatterns = [
    path('register/', RegistrationView.as_view()),
    path('login/', LoginView.as_view()),
    # path('users/', UsersAPIView.as_view()),
    # path('users/<int:pk>/', UsersDetailAPIView.as_view()),
    # path('get/', GetSelfUserView.as_view()),
    # path('get/<int:id>/', GetUserView.as_view()),
    # path('getall/', GetAllUsersListView.as_view()),
    # path('delete/<int:id>/', DeleteUserView.as_view()),
    # path('update/<int:id>/', AdminUserUpdateView.as_view()),
    # path('update/', UpdateSelfUserView.as_view()),
    path('leave-application/create/', LeaveApplicationCreateView.as_view()),
    # path('leave-applications/<int:pk>/', leave_applicationRetrieveUpdateDestroyView.as_view()),
     path('token/', RefreshTokenView.as_view()),
    #  path('', include(router.urls)),
      path('', include(router.urls)),
    # path('dj-rest-auth/registration/account-confirm-email/<str:key>/',ConfirmEmailView.as_view(),), # Needs to be defined before the registration path
    # path('dj-rest-auth/registration/', include('dj_rest_auth.registration.urls')),
    # path('dj-rest-auth/account-confirm-email/',VerifyEmailView.as_view(),name='account_email_verification_sent'),
]