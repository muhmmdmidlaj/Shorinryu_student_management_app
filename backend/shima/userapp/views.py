from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.authtoken.models import Token
from userapp.models import Users
from django.contrib.auth import authenticate
from userapp.serializers import UserSerializer
import pyotp
from django.core.mail import send_mail


class RegistrationView(APIView):
    def post(self, request):
        serializer = UserSerializer(data=request.data, partial=True)
        if serializer.is_valid():

            # email = serializer.validated_data.get('email')
            # password = serializer.validated_data.get('password')
            # name = serializer.validated_data.get('name')
            validated_data = {
                'email': serializer.validated_data.get('email'),
                'password': serializer.validated_data.get('password'),
                'name': serializer.validated_data.get('name')
            }

            # Generate OTP
            # totp = pyotp.TOTP(pyotp.random_base32())
            # otp = totp.at(0)
            
            # # Send OTP via email
            # send_mail(
            #     'OTP Verification',
            #     f'Your OTP is: {otp}',
            #     'sender@example.com',
            #     [email],
            #     fail_silently=False,
            # )
            
            # Store the OTP in user session or database for verification
            
            # Return response with OTP verification message and OTP value
            if validated_data['email'] is None or validated_data['password'] is None:
                return Response({'message': 'Email and password are required fields.'}, status=status.HTTP_400_BAD_REQUEST)
            user = Users.objects.create_user(**validated_data)
            return Response({'message': 'User created successfully'}, status=status.HTTP_201_CREATED)


            # return Response({'message': 'OTP sent for verification', 'otp': otp}, status=status.HTTP_200_OK)
        
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)



class LoginView(APIView):
    def post(self, request):
        email = request.data.get('email')
        password = request.data.get('password')

        user = authenticate(email=email, password=password)

        if user is not None:
            # token, _ = Token.objects.get_or_create(user=user)
            return Response({'message': 'LOGIND'}, status=status.HTTP_200_OK)

        return Response({'message': 'Invalid credentials'}, status=status.HTTP_401_UNAUTHORIZED)