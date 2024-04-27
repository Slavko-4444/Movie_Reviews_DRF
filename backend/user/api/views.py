from rest_framework.authtoken.models import Token
from rest_framework.decorators import api_view
from rest_framework.response import Response
from user.api.serializers import UserSerializer


@api_view(['POST', ])
def registration_view(request):
    if request.method == 'POST':
        serializer = UserSerializer(data=request.data)

        data = {}
        if serializer.is_valid():
            account = serializer.save()
            data['username'] = account.username

            data['email'] = account.email
            data['message'] = "Registration successful"
        else:
            data = serializer.errors
            return Response(data)

        return Response({
            's_message': 'User was registered successfully'
        })
