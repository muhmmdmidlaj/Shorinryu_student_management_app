from rest_framework.serializers import ModelSerializer,ValidationError

from userapp.models import Users,leave_application


class UserSerializer(ModelSerializer):
    class Meta:
        model = Users
        fields = [
            'id',
            'name',
            'profile_picture',
            'date_of_birth',
            'email',
            'gender',
            'password',
            'guardian_name',
            'guardian_contact_number',
            'number',
            'married',
            'alternate_number',
            'is_form_filled',
            'last_payment',
            "is_superuser",
            'address',
            'pincode',
            'post',
            'aadhar_number',
            'age',
            # "_all_",
        ]
        extra_kwargs = {'password': {'write_only': True}}
        

    def create(self, validated_data):
        password = validated_data.pop('password')
        user = Users(**validated_data) 
        user.set_password(password)
        user.save()
        return user
    
    # def validate(self, data):
    #     # For PATCH request, ensure users can only update their own data
    #     if self.context['request'].method == ['PATCH','GET']:
    #         user = self.context['request'].user
    #         if user.id == self.instance.id  or  user.is_superuser :
    #             return data
    #         raise ValidationError("You are not allowed to update these fields.")
    
    
    
class leave_applicationSerializer(ModelSerializer):
    user=UserSerializer()
    class Meta:
        model = leave_application
        fields = '__all__'

class leave_applicationCreateSerializer(ModelSerializer):
    class Meta:
        model = leave_application
        fields = '__all__'