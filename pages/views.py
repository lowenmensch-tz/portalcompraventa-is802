from django.shortcuts import render
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt # Este decorador solo es de prueba y no una solución para la cookie csrf

import json

# Create your views here.

@csrf_exempt # No es una solución
def testPage(request):
    return render(request,'test.html',)

@csrf_exempt # No es una solución
def gatherData(request):
    if request.method == 'POST':
        post_text = request.POST.get('name')
        print(post_text)
        response_data = {'status':'Success','nombre':'Alexis'}

        return HttpResponse(
            json.dumps(response_data),
            content_type="application/json"
        )
    else:
        return HttpResponse(
            json.dumps({"status": "Kill me Please"}),
            content_type="application/json"
        )

@csrf_exempt # No es una solución
def login(request):
    return render(request,'login.html',)

@csrf_exempt # No es una solución
def register(request):
    return render(request,'register.html',)

@csrf_exempt # No es una solución
def index(request):
    return render(request,'index.html',)