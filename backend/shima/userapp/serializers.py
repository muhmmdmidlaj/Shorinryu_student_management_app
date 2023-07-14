from rest_framework.serializers import ModelSerializer
from userapp.models import Users


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
            'gender',
            'guardian_contact_number',
            'number',
            'married',
            'alternate_number',
            'is_form_filled',
            'last_payment',
            # _all_
        ]
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        password = validated_data.pop('password')
        user.set_password(password)
        user.save()
        return user