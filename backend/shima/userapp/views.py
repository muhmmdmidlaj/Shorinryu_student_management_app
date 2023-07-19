from rest_framework.views import APIView
from datetime import date
from rest_framework.request import Request
from rest_framework.generics import CreateAPIView, RetrieveAPIView, DestroyAPIView, UpdateAPIView, ListAPIView,ListCreateAPIView,RetrieveUpdateDestroyAPIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.authtoken.models import Token
from rest_framework.permissions import AllowAny, IsAuthenticated,IsAdminUser
from userapp.models import Users,leave_application
from django.contrib.auth import authenticate
from userapp.serializers import UserSerializer,leave_applicationSerializer
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework_simplejwt.tokens import RefreshToken
from  userapp.utilities import genarate_otp





class RegistrationView(CreateAPIView):
    serializer_class = UserSerializer
    permission_classes = [AllowAny]

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()  # Save the user instance

        # Generate OTP
        otp=genarate_otp(user)
        # Generate token
        refresh = RefreshToken.for_user(user)

        data = {
            'refresh': str(refresh),
            'access': str(refresh.access_token),
            'user': UserSerializer(user).data,
            'otp': otp
        }
        return Response(data, status=status.HTTP_201_CREATED)

class LoginView(APIView):
    def post(self, request, *args, **kwargs):
        email = request.data.get('email')
        password = request.data.get('password')
        if email and password:
            try:
                user=Users.objects.get(email=email)
            except Users.DoesNotExist:
                return Response({"detail": "No active account found with the given credentials"}, status=401)
            if user.check_password(password):
                refresh = RefreshToken.for_user(user)
                data={
                    'message': 'LOGIND',
                    'user': UserSerializer(user).data,
                    'access': str(refresh.access_token),
                    'refresh': str(refresh),
                }
                return Response(data, status=status.HTTP_200_OK)
        return Response({'message': 'Invalid credentials'}, status=status.HTTP_401_UNAUTHORIZED)
    

class leave_applicationListCreateView(ListCreateAPIView):
    queryset = leave_application.objects.all()
    serializer_class = leave_applicationSerializer
    permission_classes = [IsAuthenticated]

class leave_applicationRetrieveUpdateDestroyView(RetrieveUpdateDestroyAPIView):
    queryset = leave_application.objects.all()
    serializer_class = leave_applicationSerializer
    permission_classes = [IsAuthenticated]





class GetUserView(RetrieveAPIView):
    serializer_class = UserSerializer
    queryset = Users.objects.all()
    permission_classes = [IsAuthenticated | IsAdminUser]

    def get_object(self):
        user_id = self.kwargs.get('id')  # Assuming the URL pattern captures the user ID
        user = Users.objects.get(id=int(user_id))
        if user.is_superuser or (user.id == self.request.user.id):
            return user
        else:
            self.permission_denied(self.request)


class GetSelfUserView(RetrieveAPIView):
    serializer_class = UserSerializer
    queryset = Users.objects.all()
    permission_classes = [IsAuthenticated]

    def get_object(self):
        return self.request.user
    
class UpdateUserView(UpdateAPIView):
    serializer_class = UserSerializer
    queryset = Users.objects.all()
    permission_classes = [IsAuthenticated | IsAdminUser]
    lookup_field = 'id'

    def get_object(self):
        user_id = self.kwargs.get('id')  # Assuming the URL pattern captures the user ID
        user = Users.objects.get(id=int(user_id))
        if user.is_superuser or (user.id == self.request.user.id):
            return user
        else:
            self.permission_denied(self.request)


class UpdateSelfUserView(UpdateAPIView):
    serializer_class = UserSerializer
    queryset = Users.objects.all()
    permission_classes = [IsAuthenticated]
    lookup_field = 'id'

    def get_object(self):
        return self.request.user

class DeleteUserView(DestroyAPIView):
    permission_classes = [IsAdminUser]
    queryset = Users.objects.all()
    serializer_class = UserSerializer
    lookup_field = 'id'


class GetAllUsersListView(ListAPIView):
    permission_classes = [IsAdminUser]
    queryset = Users.objects.all()
    serializer_class = UserSerializer
    
class UsersAPIView(APIView):
    authentication_classes = [JWTAuthentication]
    
    def get_authenticated_user(self, request):
        authentication = JWTAuthentication()
        user, _ = authentication.authenticate(request)
        return user

    def get(self, request):
        users = Users.objects.all()
        serializer = UserSerializer(users, many=True)
        return Response(serializer.data)

    def post(self, request):
        user = self.get_authenticated_user(request)
        if user:
            serializer = UserSerializer(data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        return Response(status=status.HTTP_401_UNAUTHORIZED)


# class GetUserView(RetrieveAPIView):
#     serializer_class = UserSerializer
#     queryset = Users.objects.all()
#     permission_classes = [IsAuthenticated | IsAdminUser]

#     def get_object(self):
#         user_id = self.kwargs.get('id')  # Assuming the URL pattern captures the user ID
#         user = Users.objects.get(id=int(user_id))
#         if user.is_superuser or (user.id == self.request.user.id):
#             return user
#         else:
#             self.permission_denied(self.request)

class UsersDetailAPIView(APIView):
    authentication_classes = [JWTAuthentication]

    def get_authenticated_user(self, request):
        authentication = JWTAuthentication()
        user= authentication.authenticate(request)
        return user

    def get_object(self, pk):
        try:
            return Users.objects.get(pk=pk)
        except Users.DoesNotExist:
            return None

    def get(self, request, pk):
        user = self.get_authenticated_user(request)
        if user:
            user_obj = self.get_object(pk)
            if user_obj:
                serializer = UserSerializer(user_obj)
                return Response(serializer.data)
            return Response(status=status.HTTP_404_NOT_FOUND)
        return Response(status=status.HTTP_401_UNAUTHORIZED)

    def put(self, request, pk):
        user = self.get_authenticated_user(request)
        if user:
            user_obj = self.get_object(pk)
            if user_obj:
                serializer = UserSerializer(user_obj, data=request.data)
                if serializer.is_valid():
                    serializer.save()
                    return Response(serializer.data)
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
            return Response(status=status.HTTP_404_NOT_FOUND)
        return Response(status=status.HTTP_401_UNAUTHORIZED)

    def delete(self, request, pk):
        user = self.get_authenticated_user(request)
        if user:
            user_obj = self.get_object(pk)
            if user_obj:
                user_obj.delete()
                return Response(status=status.HTTP_204_NO_CONTENT)
            return Response(status=status.HTTP_404_NOT_FOUND)
        return Response(status=status.HTTP_401_UNAUTHORIZED)