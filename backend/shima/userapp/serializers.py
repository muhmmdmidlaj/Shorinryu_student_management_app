from rest_framework.serializers import ModelSerializer

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
            # "_all_",
        ]
        extra_kwargs = {'password': {'write_only': True}}
        

    def create(self, validated_data):
        password = validated_data.pop('password')
        user = Users(**validated_data) 
        user.set_password(password)
        user.save()
        return user
    
    def update(self, instance, validated_data):
        password = validated_data.pop('password', None)
        if password:
            instance.set_password(password)
        return super().update(instance, validated_data)
    
    
    
class leave_applicationSerializer(ModelSerializer):
    class Meta:
        model = leave_application
        fields = ['id', 'user', 'start', 'end', 'reasone', 'is_approved']
        read_only_fields = ['id']